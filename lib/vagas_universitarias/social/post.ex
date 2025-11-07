defmodule VagasUniversitarias.Social.Post do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshJsonApi.Resource, AshAuthentication]

  alias VagasUniversitarias.Profiles

  postgres do
    table "posts"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:title, :body]
    defaults [:destroy, update: :*]

    read :read do
      prepare build(load: [:comments_count, :author, :comments])
    end

    create :create do
      primary? true
      change relate_actor(:author)
      transaction? true

      change fn changeset, ctx ->
        Ash.Changeset.after_action(changeset, fn changeset, result ->
          Profiles.consume_daily_post_quota(result.author, actor: ctx.actor)
        end)
      end
    end
  end

  policies do
    policy always() do
      authorize_if always()
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      constraints max_length: 255
      allow_nil? false
    end

    attribute :body, :string do
      allow_nil? false
    end

    timestamps()
  end

  relationships do
    belongs_to :author, VagasUniversitarias.Profiles.UserProfile do
      allow_nil? false
    end

    has_many :comments, VagasUniversitarias.Social.Comment
  end

  aggregates do
    count :comments_count, :comments
  end
end
