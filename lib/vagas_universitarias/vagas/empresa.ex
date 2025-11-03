defmodule VagasUniversitarias.Vagas.Empresa do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer

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

    attribute :nome, :string, allow_nil?: false

    attribute :logo_url, :string,
      allow_nil?: false,
      default: "/images/empresa_logo_placeholder.png"

    attribute :likes, :integer, default: 0, allow_nil?: false
    attribute :descricao, :string, allow_nil?: true, default: "Descrição não fornecida."

    timestamps()
  end

  relationships do
    has_many :vagas, VagasUniversitarias.Vagas.Vaga
  end

  aggregates do
    count :count_vagas, :vagas
  end
end
