defmodule VagasUniversitarias.Social.Comment do
  use Ash.Resource,
    otp_app: :vagas_universitarias,
    domain: VagasUniversitarias.Social,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "comments"
    repo VagasUniversitarias.Repo
  end

  actions do
    default_accept [:content, :post_id, :author_id]
    defaults [:read, :destroy, create: :*, update: :*]
  end

  attributes do
    uuid_primary_key :id

    attribute :content, :string do
      allow_nil? false
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
