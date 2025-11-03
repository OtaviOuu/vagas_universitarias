defmodule VagasUniversitarias.Vagas do
  use Ash.Domain,
    otp_app: :vagas_universitarias,
    extensions: [AshJsonApi.Domain, AshPhoenix]

  resources do
    resource VagasUniversitarias.Vagas.Vaga do
      define :list_vagas, action: :read
      define :get_vaga, action: :read, get_by: :id
      define :create_vaga, action: :create
    end

    resource VagasUniversitarias.Vagas.Empresa do
      define :list_empresas, action: :read
      define :get_empresa, action: :read, get_by: :id
      define :create_empresa, action: :create
      define :like_empresa, action: :like
    end

    resource VagasUniversitarias.Vagas.Tag do
      define :list_tags, action: :read
    end

    resource VagasUniversitarias.Vagas.VagaTag
  end
end
