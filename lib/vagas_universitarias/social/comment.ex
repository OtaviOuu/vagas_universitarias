defmodule VagasUniversitarias.Social.Comment do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication, AshPhoenix, AshArchival.Resource],
    authorizers: [Ash.Policy.Authorizer],
    notifiers: [Ash.Notifier.PubSub]

  postgres do
    table "comments"
    repo VagasUniversitarias.Repo
  end

  actions do
    defaults [:destroy]
    default_accept [:content, :post_id, :author_id]

    update :like do
      accept [:likes]
      change atomic_update(:likes, expr(likes + 1))
    end

    read :read do
      primary? true
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

    policy action_type(:destroy) do
      authorize_if relates_to_actor_via(:author)
    end

    policy action_type(:update) do
      authorize_if actor_present()
    end
  end

  pub_sub do
    module VagasUniversitariasWeb.Endpoint

    prefix "comments"
    publish :create, [:post_id]
  end

  preparations do
    prepare build(load: [:author])
  end

  attributes do
    uuid_primary_key :id

    attribute :content, :string do
      allow_nil? false
    end

    attribute :likes, :integer do
      default 0
      constraints min: 0
    end

    timestamps()
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
