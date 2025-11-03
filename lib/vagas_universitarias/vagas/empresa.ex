defmodule VagasUniversitarias.Vagas.Empresa do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource]

  json_api do
    type "empresa"
  end

  postgres do
    table "empresas"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:nome, :logo_url]
    defaults [:read, :create]

    update :like do
      accept [:likes]
      change atomic_update(:likes, expr(likes + 1))
    end
  end

  preparations do
    prepare build(sort: [likes: :desc])
  end

  attributes do
    uuid_primary_key :id

    attribute :nome, :string do
      allow_nil? false
      public? true
    end

    attribute :logo_url, :string,
      allow_nil?: false,
      default: "/images/empresa_logo_placeholder.png",
      public?: true

    attribute :likes, :integer, default: 0, allow_nil?: false

    attribute :descricao, :string,
      allow_nil?: true,
      default: "Descrição não fornecida.",
      public?: true

    timestamps()
  end

  relationships do
    has_many :vagas, VagasUniversitarias.Vagas.Vaga
  end

  aggregates do
    count :count_vagas, :vagas
  end
end
