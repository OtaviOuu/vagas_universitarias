defmodule VagasUniversitarias.Vagas.Vaga do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  alias VagasUniversitarias.Vagas.Empresa
  alias VagasUniversitarias.Vagas.Calculations.{CentavosToReais, InsertedAtFormated}

  postgres do
    table "vagas"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:titulo, :tipo, :pdf, :empresa_id, :salario_centavos]
    defaults [:read, :destroy, :update]

    create :create do
      primary? true
      accept [:titulo, :tipo, :pdf, :empresa_id, :salario_centavos]
      argument :tags, {:array, :uuid}
      change manage_relationship(:tags, type: :append)
    end

    read :list_by_empresa do
      argument :empresa_id, :uuid, allow_nil?: false

      filter expr(empresa_id == ^arg(:empresa_id))
    end
  end

  policies do
    policy action_type(:read) do
      authorize_if always()
    end

    policy action_type(:create) do
      authorize_if actor_attribute_equals(:role, :admin)
    end
  end

  preparations do
    prepare build(sort: [inserted_at: :desc])
  end

  attributes do
    uuid_primary_key :id

    attribute :titulo, :string do
      allow_nil? false
      constraints min_length: 3
    end

    attribute :pdf, :string do
      allow_nil? true
    end

    attribute :salario_centavos, :integer do
      allow_nil? true
    end

    attribute :tipo, :atom do
      allow_nil? false
      constraints one_of: [:estagio, :emprego, :trainee]
    end

    timestamps()
  end

  relationships do
    belongs_to :empresa, Empresa, allow_nil?: false

    many_to_many :tags, VagasUniversitarias.Vagas.Tag, through: VagasUniversitarias.Vagas.VagaTag
  end

  calculations do
    calculate :salario_reais, :string, CentavosToReais
    calculate :inserted_at_formatted, :string, InsertedAtFormated
  end
end
