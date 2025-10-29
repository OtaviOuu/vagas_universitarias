defmodule VagasUniversitarias.Accounts do
  use Ash.Domain,
    otp_app: :vagas_universitarias

  resources do
    resource VagasUniversitarias.Accounts.Token
    resource VagasUniversitarias.Accounts.User
  end
end
