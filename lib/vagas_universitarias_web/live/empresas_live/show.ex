defmodule VagasUniversitariasWeb.EmpresasLive.Show do
  use VagasUniversitariasWeb, :live_view

  alias VagasUniversitarias.Vagas

  def mount(%{"id" => empresa_id}, _session, socket) do
    socket =
      socket
      |> load_empresa(empresa_id)

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

    <!-- Card Header da Empresa -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex items-start gap-6">
                <!-- Logo -->
                <div class="avatar">
                  <div class="w-24 h-24 rounded-box">
                    <img
                      src={@empresa.result.logo_url}
                      :if={@empresa.ok?}
                      alt="BTG Logo"
                    />
                  </div>
                </div>

    <!-- Informações -->
                <div class="flex-1">
                  <h1 class="text-3xl font-bold mb-2">BTG Pactual</h1>
                  <p class="opacity-80 mb-4">
                    Banco de investimentos líder na América Latina, oferecendo oportunidades
                    desafiadoras e ambiente de crescimento acelerado para jovens talentos.
                  </p>

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

    <!-- Botão de Seguir -->
                <div>
                  <button class="btn btn-primary gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"
                      />
                    </svg>
                    Seguir Empresa
                  </button>
                  <button class="btn btn-ghost btn-sm mt-2 w-full gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"
                      />
                    </svg>
                    Visitar Site
                  </button>
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
              <div class="divider"></div>
              <div class="space-y-3">
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">Fundação</div>
                  <div class="font-medium">1983</div>
                </div>
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">Sede</div>
                  <div class="font-medium">São Paulo, Brasil</div>
                </div>
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">Funcionários</div>
                  <div class="font-medium">5.000+ colaboradores</div>
                </div>
              </div>
            </div>
          </div>

    <!-- Card de Estatísticas -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Estatísticas</h2>
              <div class="stats stats-vertical shadow-sm">
                <div class="stat p-3">
                  <div class="stat-title text-xs">Vagas Abertas</div>
                  <div class="stat-value text-2xl text-primary">8</div>
                  <div class="stat-desc">+2 esta semana</div>
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

  defp load_empresa(socket, empresa_id) do
    assign_async(socket, :empresa, fn ->
      {:ok, %{empresa: Vagas.get_empresa!(empresa_id, load: [vagas: [:salario_reais]])}}
    end)
  end
end
