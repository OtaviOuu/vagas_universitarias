defmodule VagasUniversitarias.Social.Notifications do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "notifications"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:message, :read]
    defaults [:read, :destroy, create: :*, update: :*]
  end

  attributes do
    uuid_primary_key :id

    attribute :message, :string do
      allow_nil? false
    end

    attribute :read, :boolean do
      default false
    end

    timestamps()
  end

  relationships do
    many_to_many :user_profiles, VagasUniversitarias.Profiles.UserProfile,
      through: VagasUniversitarias.Social.ProfileNotifications
  end

  aggregates do
    count :user_profiles_count, :user_profiles
  end
end
