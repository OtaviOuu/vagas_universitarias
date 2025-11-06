defmodule VagasUniversitarias.Profiles do
  use Ash.Domain,
    otp_app: :vagas_universitarias,
    extensions: [AshPhoenix]

  resources do
    resource VagasUniversitarias.Profiles.UserProfile do
      define :create_user_profile, action: :create
      define :consume_daily_post_quota, action: :consume_daily_post_quota
    end
  end
end
