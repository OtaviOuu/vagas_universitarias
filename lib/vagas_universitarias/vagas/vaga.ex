defmodule VagasUniversitarias.Vagas.Vaga do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  postgres do
    table "vagas"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:titulo, :tipo, :pdf]
    defaults [:read, :destroy, :create, :update]
  end

  policies do
    policy action_type(:read) do
      authorize_if always()
    end

    policy action_type(:create) do
      authorize_if actor_attribute_equals(:role, :admin)
    end
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

    attribute :tipo, :atom do
      allow_nil? false
      constraints one_of: [:estagio, :emprego, :trainee]
    end

    timestamps()
  end
end
