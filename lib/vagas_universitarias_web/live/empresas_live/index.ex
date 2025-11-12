defmodule VagasUniversitariasWeb.EmpresasLive.Index do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_optional}

  alias VagasUniversitarias.Vagas

  def mount(_params, _session, socket) do
    socket =
      socket
      |> load_empresas

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <!-- Coluna Principal -->
        <div class="flex-1 space-y-4">
          <!-- Header -->
          <div class="flex items-center justify-between mb-6">
            <div>
              <h1 class="text-3xl font-bold">Empresas</h1>
              <p class="text-sm opacity-60 mt-1">Descubra as melhores empresas para sua carreira</p>
            </div>
          </div>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <.async_result :let={empresas} assign={@empresas}>
              <:loading>
                <.loading_spinner />
              </:loading>
              <:failed :let={reason}>{reason}</:failed>
              <.empresas_grid empresas={empresas} />
            </.async_result>
          </div>
        </div>

        <div class="w-80 space-y-4">
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Estatísticas</h2>
              <div class="stats stats-vertical ">
                <div class="stat p-3">
                  <div class="stat-title text-xs">Empresas Cadastradas</div>
                  <div :if={@empresas.ok?} class="stat-value text-2xl">
                    {@total_empresas.result}
                  </div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Total de Vagas</div>
                  <div :if={@empresas.ok?} class="stat-value text-2xl text-primary">
                    {@total_vagas.result}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def empresas_grid(assigns) do
    ~H"""
    <div
      :for={empresa <- @empresas}
      class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer"
      phx-click={JS.navigate(~p"/empresas/#{empresa.id}")}
    >
      <div class="card-body">
        <div class="flex items-start gap-4">
          <div class="avatar">
            <div class="w-16 h-16 rounded-box">
              <img src={empresa.logo_url} />
            </div>
          </div>
          <div class="flex-1">
            <h3 class="card-title text-lg">{empresa.nome}</h3>
            <p class="text-sm opacity-60">Serviços Financeiros</p>
          </div>
          <button class="btn btn-ghost btn-sm btn-square">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"
              />
            </svg>
          </button>
        </div>

        <p class="text-sm opacity-80 mt-2 line-clamp-2">
          {empresa.descricao}
        </p>

        <div class="flex gap-4 mt-3">
          <div class="flex-1">
            <div class="text-xs opacity-60">Vagas</div>
            <div class="font-bold text-primary">{empresa.count_vagas} vagas</div>
          </div>
          <div class="flex-1">
            <div class="text-xs opacity-60">Likes</div>
            <div class="font-bold">{empresa.likes}</div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp load_empresas(socket) do
    assign_async(socket, [:empresas, :total_vagas, :total_empresas], fn ->
      empresas = Vagas.list_empresas!(load: [:vagas, :count_vagas])

      total_vagas =
        empresas
        |> Enum.map(& &1.count_vagas)
        |> Enum.sum()


      total_empresas = length(empresas)
      {:ok,
       %{
           empresas: empresas,
           total_vagas: total_vagas,
           total_empresas: total_empresas
         }}
    end)
  end
end
