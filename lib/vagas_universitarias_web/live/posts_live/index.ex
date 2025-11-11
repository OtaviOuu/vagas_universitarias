defmodule VagasUniversitariasWeb.PostsLive.Index do
  use VagasUniversitariasWeb, :live_view
  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_required_with_profile}

  alias VagasUniversitarias.Social

  def mount(_params, _session, socket) do
    posts = Social.list_posts!()
    IO.inspect(posts, label: "Posts")
    {:ok, assign(socket, posts: posts)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <div class="flex-1 space-y-4">
          <div class="tabs tabs-boxed bg-base-100 shadow-md p-2">
            <a class="tab tab-active">Popular</a>
            <a class="tab">Recente</a>
            <a class="tab">Sem resposta</a>
            <a class="tab">Respondido</a>
          </div>

          <.button class="btn btn-primary btn-block" phx-click={JS.navigate(~p"/forum/topics/new")}>
            <.icon name="hero-plus" class="w-5 h-5 mr-2" /> Criar nova discussão
          </.button>

          <div
            :for={post <- @posts}
            class="space-y-3"
            phx-click={JS.navigate(~p"/forum/topics/#{post.id}")}
          >
            <div class="card bg-base-100 shadow-md hover:shadow-lg transition-shadow cursor-pointer">
              <div class="card-body p-4">
                <div class="flex gap-4">
                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-2">
                      <div class="w-8 h-8">
                        <.avatar avatar_url={post.author.avatar_url} />
                      </div>
                      <span class="text-sm font-medium">{post.author.nick_name}</span>
                      <span class="text-xs opacity-60">
                        • {post.inserted_at}
                      </span>
                      <div class="badge badge-primary badge-sm">Dúvida</div>
                    </div>

                    <h3 class="font-bold text-lg hover:text-primary transition-colors">
                      {post.title}
                    </h3>
                    <p class="text-sm opacity-80 mt-2 line-clamp-2">
                      {post.body}
                    </p>

                    <div class="flex items-center gap-4 mt-3">
                      <button class="btn btn-ghost btn-xs gap-1">
                        <.icon name="hero-chat-bubble-oval-left-ellipsis" /> {post.comments_count}
                      </button>
                      <button class="btn btn-ghost btn-xs gap-1">
                        <.icon name="hero-heart" /> {post.likes}
                      </button>
                        <button class="btn btn-ghost btn-xs gap-1">
                        <.icon name="hero-eye" /> {post.views}
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="w-80 space-y-4">
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Tags</h2>
              <div class="flex flex-wrap gap-2 mt-2">
                <div :for={_ <- 1..5} class="badge badge-lg">Entrevistas</div>
              </div>
            </div>
          </div>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Comunidade</h2>
              <div class="stats stats-vertical">
                <div class="stat p-3">
                  <div class="stat-title text-xs">Membros</div>
                  <div class="stat-value text-xl">12.5k</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Online agora</div>
                  <div class="stat-value text-xl text-success">342</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Posts hoje</div>
                  <div class="stat-value text-xl">87</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
