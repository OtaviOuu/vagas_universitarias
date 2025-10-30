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
  end

  attributes do
    uuid_primary_key :id

    attribute :nome, :string, allow_nil?: false
    attribute :logo_url, :string, allow_nil?: false
    timestamps()
  end

  relationships do
    has_many :vagas, VagasUniversitarias.Vagas.Vaga
  end

  aggregates do
    count :count_vagas, :vagas
  end
end
