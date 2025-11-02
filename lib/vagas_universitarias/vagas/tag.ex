defmodule VagasUniversitarias.Vagas.Tag do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "tags"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:name]
    defaults [:read, :create, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :atom do
      allow_nil? false
    end

    timestamps()
  end

  relationships do
    many_to_many :vagas, VagasUniversitarias.Vagas.Vaga,
      through: VagasUniversitarias.Vagas.VagaTag
  end
end
