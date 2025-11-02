defmodule VagasUniversitarias.Vagas.VagaTag do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "vaga_tags"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:vaga_id, :tag_id]
    defaults [:read, :create, :update, :destroy]
  end

  relationships do
    belongs_to :vaga, VagasUniversitarias.Vagas.Vaga
    belongs_to :tag, VagasUniversitarias.Vagas.Tag
  end
end
