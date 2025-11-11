defmodule VagasUniversitarias.Social.ProfileNotifications do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "profile_notifications"
    repo VagasUniversitarias.Repo
  end

  actions do
    defaults [:create, :read]

    read :list_notifications_by_user do
      argument :user_profile_id, :uuid do
        allow_nil? false
      end

      filter expr(user_profiles.id == ^arg(:user_profile_id))
    end
  end

  relationships do
    belongs_to :user_profile, VagasUniversitarias.Profiles.UserProfile
    belongs_to :notifications, VagasUniversitarias.Social.Notifications
  end
end
