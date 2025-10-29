defmodule VagasUniversitarias.Vagas do
  use Ash.Domain,
    otp_app: :vagas_universitarias,
    extensions: [AshPhoenix]

  resources do
    resource VagasUniversitarias.Vagas.Vaga do
      define :list_vagas, action: :read
      define :create_vaga, action: :create
    end

    resource VagasUniversitarias.Vagas.Empresa
  end
end
