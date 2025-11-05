defmodule VagasUniversitarias.Social do
  use Ash.Domain,
    otp_app: :vagas_universitarias

  resources do
    resource VagasUniversitarias.Social.Post do
      define :list_posts, action: :read
      define :get_post, action: :read, get_by: :id
    end

    resource VagasUniversitarias.Social.Comment
  end
end
