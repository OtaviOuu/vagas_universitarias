defmodule VagasUniversitariasWeb.EmpresasLive.Show do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_optional}

  alias VagasUniversitarias.Vagas

  def mount(%{"id" => empresa_id}, _session, socket) do
    socket =
      socket
      |> assign_empresa(empresa_id)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <!-- Coluna Principal -->
        <div class="flex-1 space-y-4">
          <!-- Botão Voltar -->
          <button class="btn btn-ghost btn-sm" phx-click={JS.navigate(~p"/vagas")}>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M10 19l-7-7m0 0l7-7m-7 7h18"
              />
            </svg>
            Voltar para vagas
          </button>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex items-start gap-6">
                <div class="avatar">
                  <div class="w-24 h-24 rounded-box">
                    <img
                      :if={@empresa.ok?}
                      src={@empresa.result.logo_url}
                      alt="Logo da Empresa"
                    />
                  </div>
                </div>

                <div class="flex-1">
                  <h1 :if={@empresa.ok?} class="text-3xl font-bold mb-2">{@empresa.result.nome}</h1>
                </div>
                <div
                  :if={@empresa.ok?}
                  class="flex items-center gap-1 text-sm opacity-80"
                  phx-click="like"
                >
                  {@empresa.result.likes} Likes
                  <.icon name="hero-heart hover:text-red-500 hover:scale-125 hover:transition-transform cursor-pointer" />
                </div>
              </div>
            </div>
          </div>
          
    <!-- Lista de Vagas -->
          <.async_result :let={empresa} assign={@empresa}>
            <:loading>
              <.loading_spinner />
            </:loading>
            <:failed :let={reason}>{reason}</:failed>
            <.job_listing vagas={empresa.vagas} />
          </.async_result>
        </div>
        
    <!-- Coluna Lateral -->
        <div class="w-80 space-y-4">
          <!-- Card Sobre a Empresa -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Sobre a Empresa</h2>
              <p :if={@empresa.ok?} class="text-sm opacity-80 leading-relaxed">
                {@empresa.result.descricao}
              </p>
            </div>
          </div>
          
    <!-- Card de Estatísticas -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Estatísticas</h2>
              <div class="stats stats-vertical">
                <div class="stat p-3">
                  <div class="stat-title text-xs">Vagas Abertas</div>
                  <div :if={@empresa.ok?} class="stat-value text-2xl text-primary">
                    {@empresa.result.count_vagas}
                  </div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Seguidores</div>
                  <div class="stat-value text-2xl text-secondary">2.3k</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Taxa de Resposta</div>
                  <div class="stat-value text-2xl text-accent">87%</div>
                  <div class="stat-desc">Tempo médio: 3 dias</div>
                </div>
              </div>
            </div>
          </div>
          <.button class="btn btn-primary btn-block">
            <.icon name="hero-plus" class="w-5 h-5 mr-2" /> Seguir Empresa
          </.button>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp job_listing(assigns) do
    ~H"""
    <ul class="list bg-base-100 rounded-box shadow-md">
      <li
        :for={vaga <- @vagas}
        class="list-row hover:bg-base-200 flex items-center justify-between"
        phx-click={JS.navigate(~p"/vagas/#{vaga.id}")}
      >
        <div class="flex flex-col flex-1 gap-1 justify-center">
          <div class="font-semibold">{vaga.titulo}</div>
          <div class="flex gap-2">
            <div class="badge badge-soft badge-secondary">{vaga.tipo}</div>
          </div>
          <div class="text-xs opacity-60 mt-1">Publicado há 2 dias</div>
        </div>

        <div class="flex items-center gap-2">
          <div class="badge badge-soft badge-primary">R$ {vaga.salario_reais}</div>
          <div class="badge badge-outline">São Paulo - SP</div>
        </div>
      </li>
    </ul>
    """
  end

  defp assign_empresa(socket, empresa_id) do
    assign_async(socket, :empresa, fn ->
      {:ok,
       %{
         empresa:
           Vagas.get_empresa!(empresa_id,
             load: [:count_vagas, vagas: [:salario_reais, :tags]]
           )
       }}
    end)
  end

  def handle_event("like", _params, socket) when is_nil(socket.assigns.current_user) do
    {:noreply,
     socket
     |> put_flash(:info, "Você precisa estar logado para curtir uma empresa!")
     |> push_navigate(to: ~p"/sign-in")}
  end

  def handle_event("like", _params, socket) do
    empresa = socket.assigns.empresa.result

    case Vagas.like_empresa(empresa, actor: socket.assigns.current_user) do
      {:ok, _updated_empresa} ->
        socket =
          socket
          |> assign_empresa(empresa.id)
          |> put_flash(:info, "Você curtiu a empresa com sucesso!")

        {:noreply, socket}

      {:error, _reason} ->
        {:noreply, socket}
    end
  end
end
