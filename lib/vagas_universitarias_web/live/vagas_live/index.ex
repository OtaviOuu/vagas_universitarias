defmodule VagasUniversitariasWeb.VagasLive.Index do
  use VagasUniversitariasWeb, :live_view

  alias VagasUniversitarias.Vagas

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_optional}

  def mount(_params, _session, socket) do
    socket =
      socket
      |> set_page_title
      |> assign_current_user
      |> load_vagas

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.actions current_user={@current_user} />
      <.async_result :let={vagas} assign={@vagas}>
        <:loading>
          <.loading_spinner />
        </:loading>
        <:failed :let={reason}>{reason}</:failed>
        <.job_list vagas={vagas} />
      </.async_result>
    </Layouts.app>
    """
  end

  def actions(assigns) do
    ~H"""
    <div class="flex items-center space-x-4 mb-4">
      <.button
        :if={Vagas.can_create_vaga?(@current_user)}
        phx-click={JS.navigate(~p"/vagas/new")}
        class="btn btn-primary"
      >
        <.icon name="hero-plus" class="w-4 h-4 mr-2" /> Nova Vaga
      </.button>
      <.button
        :if={Vagas.can_create_vaga?(@current_user)}
        phx-click={JS.navigate(~p"/empresas/new")}
        class="btn btn-primary"
      >
        <.icon name="hero-plus" class="w-4 h-4 mr-2" /> Nova Empresa
      </.button>
    </div>
    """
  end

  def job_list(assigns) do
    ~H"""
    <ul class="list bg-base-100 rounded-box shadow-md">
      <li class="p-4 pb-2 text-xs opacity-60 tracking-wide">Vagas mais recentes</li>

      <li
        :for={vaga <- @vagas}
        class="list-row hover:bg-base-200"
        phx-click={JS.navigate(~p"/vagas/#{vaga.id}")}
      >
        <div>
          <img
            class="size-10 rounded-box"
            src={vaga.empresa.logo_url}
          />
        </div>
        <div class="flex flex-col flex-1 gap-1">
          <div>
            {vaga.empresa.nome}: {vaga.titulo} - <span class="text-secondary">{vaga.tipo}</span>
          </div>
          <div class="flex gap-2">
            <div :for={_tags <- 1..3} class="badge badge-soft badge-secundary">tag</div>
          </div>
        </div>
        <div class="badge badge-soft badge-primary">R$ {vaga.salario_reais}</div>
        <div class="badge badge-outline">São Paulo - SP</div>
      </li>
    </ul>
    """
  end

  defp set_page_title(socket) do
    assign(socket, :page_title, "Vagas Universitárias")
  end

  defp assign_current_user(socket) do
    assign(socket, :current_user, Map.get(socket.assigns, :current_user))
  end

  defp load_vagas(socket) do
    assign_async(socket, :vagas, fn ->
      {:ok, %{vagas: Vagas.list_vagas!(load: [:empresa, :salario_reais])}}
    end)
  end
end
