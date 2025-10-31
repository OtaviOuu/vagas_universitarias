defmodule VagasUniversitarias.Profiles do
  use Ash.Domain,
    otp_app: :vagas_universitarias,
    extensions: [AshPhoenix]

  resources do
    resource VagasUniversitarias.Profiles.UserProfile do
      define :create_user_profile, action: :create
    end
  end
end
