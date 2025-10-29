defmodule VagasUniversitarias.Vagas.Vaga do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Vagas,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "vagas"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:titulo, :tipo]
    defaults [:read, :destroy, :create, :update]
  end

  attributes do
    uuid_primary_key :id

    attribute :titulo, :string do
      allow_nil? false
      constraints min_length: 3
    end

    attribute :tipo, :atom do
      allow_nil? false
      constraints one_of: [:estagio, :emprego, :trainee]
    end

    timestamps()
  end
end
