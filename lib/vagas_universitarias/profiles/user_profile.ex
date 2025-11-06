defmodule VagasUniversitarias.Profiles.UserProfile do
  require Ash.Resource.Change.Builtins

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
    default_accept [:full_name, :nick_name, :user_id, :bio, :avatar_url]
    defaults [:create, :read, :destroy]

    update :consume_daily_post_quota do
      accept [:daily_posts_limit]

      change atomic_update(:daily_posts_limit, expr(daily_posts_limit - 1))
    end
  end

  policies do
    policy action_type(:read) do
      authorize_if expr(true)
    end

    policy action_type(:create) do
      authorize_if actor_present()
    end

    policy action_type(:update) do
      forbid_if expr(daily_posts_limit <= 0)
      authorize_if expr(id == ^actor(:id))
    end

    policy action_type(:destroy) do
      authorize_if expr(user_id == ^actor(:id))
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :full_name, :string, public?: true
    attribute :nick_name, :string, public?: true, allow_nil?: false
    attribute :bio, :string, public?: true, allow_nil?: false
    attribute :avatar_url, :string, public?: true, allow_nil?: false

    attribute :daily_posts_limit, :integer, default: 5

    timestamps()
  end

  relationships do
    belongs_to :user, VagasUniversitarias.Accounts.User, allow_nil?: false, public?: true
  end

  identities do
    identity :user_id_unique, [:user_id]
  end
end
