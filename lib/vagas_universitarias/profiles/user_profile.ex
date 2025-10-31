defmodule VagasUniversitarias.Profiles.UserProfile do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Profiles,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  postgres do
    table "user_profiles"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:full_name, :nick_name, :user_id]
    defaults [:create, :read, :update, :destroy]
  end

  policies do
    policy action_type(:read) do
      authorize_if expr(true)
    end

    policy action_type(:create) do
      authorize_if actor_present()
    end

    policy action_type(:update) do
      authorize_if actor_attribute_equals(:id, :user_id)
    end

    policy action_type(:destroy) do
      authorize_if actor_attribute_equals(:id, :user_id)
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :full_name, :string, public?: true
    attribute :nick_name, :string, public?: true, allow_nil?: false

    timestamps()
  end

  relationships do
    belongs_to :user, VagasUniversitarias.Accounts.User, allow_nil?: false, public?: true
  end

  identities do
    identity :user_id_unique, [:user_id]
  end
end
