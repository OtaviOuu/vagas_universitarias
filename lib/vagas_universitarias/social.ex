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
      define :like_post, action: :like
      define :dislike_post, action: :dislike
      define :delete_post, action: :destroy
      define :view_post, action: :view
    end

    resource VagasUniversitarias.Social.Comment do
      define :create_comment, action: :create
      define :delete_comment, action: :destroy
    end
  end
end
