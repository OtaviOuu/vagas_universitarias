defmodule VagasUniversitariasWeb.PostsLive.Show do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_required_with_profile}

  alias VagasUniversitarias.Social

  def mount(%{"id" => id}, _session, socket) do
    if connected?(socket) do
      VagasUniversitariasWeb.Endpoint.subscribe("comments:#{id}")
    end

    post = Social.get_post!(id)
    user = socket.assigns.current_user

    create_comment_form =
      Social.form_to_create_comment(id, actor: user.user_profile) |> to_form

    {:ok, assign(socket, post: post, user: user, create_comment_form: create_comment_form)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <!-- Coluna Principal -->
        <div class="flex-1 space-y-4">
          <!-- Botão Voltar -->
          <button class="btn btn-ghost btn-sm" phx-click={JS.navigate(~p"/forum/topics")}>
            <.icon name="hero-arrow-left" class="w-5 h-5 mr-2" /> Voltar para o fórum
          </button>
          
    <!-- Post Principal -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex gap-4">
                <!-- Votação -->
                <div class="flex flex-col items-center gap-2 min-w-[50px]">
                  <button class="btn btn-ghost btn-sm btn-square hover:text-primary">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M5 15l7-7 7 7"
                      />
                    </svg>
                  </button>
                  <span class="font-bold text-2xl">142</span>
                  <button class="btn btn-ghost btn-sm btn-square hover:text-error">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M19 9l-7 7-7-7"
                      />
                    </svg>
                  </button>
                </div>
                
    <!-- Conteúdo -->
                <div class="flex-1">
                  <!-- Header do Post -->
                  <div class="flex items-center gap-2 mb-3">
                    <div class="w-8 h-8">
                      <.avatar avatar_url={@post.author.avatar_url} />
                    </div>
                    <div class="flex-1">
                      <div class="flex items-center gap-2">
                        <span class="font-medium">{@post.author.nick_name}</span>
                        <span class="text-xs opacity-60">• {@post.inserted_at}</span>
                      </div>
                      <div class="badge badge-primary badge-sm">Dúvida</div>
                    </div>
                    <div class="dropdown dropdown-end">
                      <button class="btn btn-ghost btn-sm btn-square">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"
                          />
                        </svg>
                      </button>
                    </div>
                  </div>
                  
    <!-- Título -->
                  <h1 class="text-2xl font-bold mb-4">
                    {@post.title}
                  </h1>
                  
    <!-- Conteúdo Completo -->
                  <div class="prose max-w-none">
                    <p class="opacity-80 leading-relaxed mb-4">
                      {@post.body}
                    </p>
                  </div>
                  
    <!-- Ações -->
                  <div class="flex items-center gap-4 mt-6 pt-4 border-t border-base-300">
                    <button class="btn btn-ghost btn-sm gap-2">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"
                        />
                      </svg>
                      <span>{@post.comments_count} comentários</span>
                    </button>
                    <button class="btn btn-ghost btn-sm gap-2">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"
                        />
                      </svg>
                      <span>Compartilhar</span>
                    </button>
                    <button class="btn btn-ghost btn-sm gap-2">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"
                        />
                      </svg>
                      <span>Salvar</span>
                    </button>
                    <button class="btn btn-ghost btn-sm gap-2 ml-auto">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9"
                        />
                      </svg>
                      <span>Reportar</span>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
    <!-- Ordenação de Comentários -->
          <div class="flex items-center justify-between">
            <span class="text-sm opacity-60">{@post.comments_count} comentários</span>
            <div class="tabs tabs-boxed tabs-sm">
              <a class="tab tab-active">Mais votados</a>
              <a class="tab">Mais recentes</a>
              <a class="tab">Mais antigos</a>
            </div>
          </div>
          
    <!-- Lista de Comentários -->
          <div class="space-y-4">
            <!-- Comentário 1 -->
            <div :for={comment <- @post.comments} class="card bg-base-100 shadow-md">
              <div class="card-body">
                <div class="flex gap-4">
                  <!-- Votação -->
                  <div class="flex flex-col items-center gap-1 min-w-[40px]">
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M5 15l7-7 7 7"
                        />
                      </svg>
                    </button>
                    <span class="font-bold text-sm">45</span>
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 9l-7 7-7-7"
                        />
                      </svg>
                    </button>
                  </div>
                  
    <!-- Conteúdo do Comentário -->
                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-2">
                      <div class="w-8 h-8">
                        <.avatar avatar_url={@post.author.avatar_url} />
                      </div>
                      <span class="font-medium text-sm">{comment.author.nick_name}</span>
                      <div class="badge badge-success badge-xs">TOP</div>
                      <span class="text-xs opacity-60">• {comment.inserted_at}</span>
                    </div>
                    <p class="text-sm opacity-80 leading-relaxed mb-3">
                      {comment.content}
                    </p>
                    <div class="flex items-center gap-3">
                      <button class="btn btn-ghost btn-xs">Responder</button>
                      <button class="btn btn-ghost btn-xs">Compartilhar</button>
                      <.button
                        :if={Social.can_delete_comment?(@user.user_profile, comment)}
                        phx-click="delete_comment"
                        phx-disable-with="Deletando..."
                        data-confirm="Tem certeza que deseja deletar este comentário?"
                        phx-value-comment-id={comment.id}
                        class="btn btn-ghost btn-xs text-error"
                      >
                        Deletar
                      </.button>
                    </div>
                    
    <!-- Resposta aninhada -->
                    <div :if={false} class="ml-6 mt-4 pl-4 border-l-2 border-base-300">
                      <div class="flex gap-3">
                        <div class="flex flex-col items-center gap-1 min-w-[30px]">
                          <button class="btn btn-ghost btn-xs btn-square">
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M5 15l7-7 7 7"
                              />
                            </svg>
                          </button>
                          <span class="font-bold text-xs">12</span>
                          <button class="btn btn-ghost btn-xs btn-square">
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M19 9l-7 7-7-7"
                              />
                            </svg>
                          </button>
                        </div>
                        <div class="flex-1">
                          <div class="flex items-center gap-2 mb-2">
                            <span class="font-medium text-sm">{@post.author.nick_name}</span>
                            <div class="badge badge-primary badge-xs">OP</div>
                            <span class="text-xs opacity-60">• há 1 hora</span>
                          </div>
                          <p class="text-sm opacity-80 leading-relaxed mb-2">
                            Muito obrigado pelas dicas! Já comecei a ler o Cracking the Coding Interview.
                            Você poderia compartilhar algum roadmap de estudo que seguiu?
                          </p>
                          <div class="flex items-center gap-3">
                            <button class="btn btn-ghost btn-xs">Responder</button>
                            <button class="btn btn-ghost btn-xs">Compartilhar</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
    <!-- Campo de Novo Comentário -->
            <.comment_form user={@user} form={@create_comment_form} post={@post} />
            
    <!-- Botão Carregar Mais -->
            <button class="btn btn-outline btn-block">
              Carregar mais comentários (25 restantes)
            </button>
          </div>
        </div>
        
    <!-- Coluna Lateral -->
        <div class="w-80 space-y-4">
          <!-- Card do Autor -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Sobre o autor</h2>
              <div class="flex items-center gap-3 ">
                <.avatar avatar_url={@post.author.avatar_url} />
                <div class="flex-1">
                  <div class="font-medium">{@post.author.nick_name}</div>
                  <div class="text-xs opacity-60">Membro há {@post.author.inserted_at}</div>
                </div>
              </div>
              <div class="stats stats-vertical mt-3">
                <div class="stat p-2">
                  <div class="stat-title text-xs">Karma</div>
                  <div class="stat-value text-lg">1,234</div>
                </div>
                <div class="stat p-2">
                  <div class="stat-title text-xs">Posts</div>
                  <div class="stat-value text-lg">23</div>
                </div>
                <div class="stat p-2">
                  <div class="stat-title text-xs">Comentários</div>
                  <div class="stat-value text-lg">187</div>
                </div>
              </div>
              <button class="btn btn-primary btn-sm mt-2">Ver perfil</button>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp comment_form(assigns) do
    ~H"""
    <div class="card bg-base-100 shadow-md">
      <div class="card-body">
        <div class="flex gap-3">
          <div class="flex-1">
            <.form for={@form} phx-submit="create_comment">
              <.input
                type="textarea"
                field={@form[:content]}
                placeholder="Adicione um comentário..."
                class="textarea textarea-bordered w-full"
                rows="3"
              />

              <div :if={Social.can_create_comment?(@user)} class="flex justify-end gap-2 mt-2">
                <.button class="btn btn-primary btn-sm">Comentar</.button>
              </div>
            </.form>
          </div>
        </div>
      </div>
    </div>
    """
  end

  # lixo
  def handle_info(%{topic: "comments:" <> id} = algo, socket) do
    {:noreply,
     update(socket, :post, fn post ->
       Social.get_post!(id)
     end)}
  end

  def handle_event("create_comment", %{"form" => comment_params}, socket) do
    form = socket.assigns.create_comment_form

    case AshPhoenix.Form.submit(form,
           params: comment_params
         ) do
      {:ok, _comment} ->
        {:noreply,
         socket
         |> put_flash(:info, "Comentário criado com sucesso!")
         |> push_navigate(to: ~p"/forum/topics/#{socket.assigns.post.id}")}

      {:error, form} ->
        {:noreply, assign(socket, create_comment_form: form)}
    end
  end

  def handle_event("delete_comment", %{"comment-id" => comment_id}, socket) do
    comment = socket.assigns.post.comments |> Enum.find(&(&1.id == comment_id))

    case Social.delete_comment(comment, actor: socket.assigns.user.user_profile) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "Comentário deletado com sucesso!")
         |> push_navigate(to: ~p"/forum/topics/#{socket.assigns.post.id}")}

      {:error, _reason} ->
        {:noreply,
         socket
         |> put_flash(:error, "Não foi possível deletar o comentário.")}
    end
  end
end
