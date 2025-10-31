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

                  <div class="flex flex-wrap gap-3">
                    <div class="badge badge-lg badge-outline gap-2">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"
                        />
                      </svg>
                      Serviços Financeiros
                    </div>
                    <div class="badge badge-lg badge-outline gap-2">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                        />
                      </svg>
                      5.000+ funcionários
                    </div>
                    <div class="badge badge-lg badge-outline gap-2">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                        />
                      </svg>
                      São Paulo, SP
                    </div>
                  </div>
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
          
    <!-- Filtros e Ordenação -->
          <div class="flex items-center justify-between">
            <div class="tabs tabs-boxed">
              <a class="tab tab-active">Todas (8)</a>
              <a class="tab">Estágio (5)</a>
              <a class="tab">Trainee (2)</a>
              <a class="tab">Júnior (1)</a>
            </div>
            <select class="select select-bordered select-sm">
              <option>Mais recentes</option>
              <option>Maior salário</option>
              <option>Menor salário</option>
            </select>
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
              <p class="text-sm opacity-80 leading-relaxed">
                O BTG Pactual é o maior banco de investimentos da América Latina,
                com uma cultura de meritocracia e alto desempenho. Valorizamos
                inovação, trabalho em equipe e excelência.
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
      <li class="p-4 pb-2 text-xs opacity-60 tracking-wide">
        8 vagas disponíveis
      </li>

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
             load: [:count_vagas, vagas: [:salario_reais]]
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
