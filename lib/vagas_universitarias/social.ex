defmodule VagasUniversitarias.Social do
  use Ash.Domain,
    otp_app: :vagas_universitarias,
    extensions: [AshPhoenix]

  forms do
    form :create_comment, args: [:post_id]
  end

  resources do
    resource VagasUniversitarias.Social.Post do
      define :create_post, action: :create
      define :list_posts, action: :read
      define :get_post, action: :read, get_by: :id
    end

    resource VagasUniversitarias.Social.Comment do
      define :create_comment, action: :create
    end
  end
end
