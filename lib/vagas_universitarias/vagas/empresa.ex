defmodule VagasUniversitarias.Vagas.Empresa do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "empresas"
    repo VagasUniversitarias.Repo
  end
end
