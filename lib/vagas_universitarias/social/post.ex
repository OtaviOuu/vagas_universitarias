defmodule VagasUniversitarias.Social.Post do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshJsonApi.Resource, AshAuthentication]

  postgres do
    table "posts"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:title, :body, :author_id]
    defaults [:read, :destroy, create: :*, update: :*]
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
end
