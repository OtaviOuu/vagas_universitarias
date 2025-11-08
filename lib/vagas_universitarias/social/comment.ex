defmodule VagasUniversitarias.Social.Comment do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication, AshPhoenix],
    authorizers: [Ash.Policy.Authorizer],
    notifiers: [Ash.Notifier.PubSub]


  postgres do
    table "comments"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:content, :post_id]

    read :read do
      primary? true
      prepare build(load: [:author])
    end

    create :create do
      primary? true
      change relate_actor(:author)
    end
  end

  policies do
    policy action_type(:create) do
      authorize_if always()
    end

    policy action_type(:read) do
      authorize_if always()
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :content, :string do
      allow_nil? false
    end

    timestamps()
  end

  pub_sub do
    module VagasUniversitariasWeb.Endpoint

    prefix "comments"
    publish :create, [:post_id]
  end


  relationships do
    belongs_to :post, VagasUniversitarias.Social.Post do
      allow_nil? false
    end

    belongs_to :author, VagasUniversitarias.Profiles.UserProfile do
      allow_nil? false
    end
  end
end
