defmodule VagasUniversitariasWeb.VagasLive.Index do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_optional}

  alias VagasUniversitarias.Vagas

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

  # todo: um component para usar na lista de vagas e
  # na lista de vagas associadas a uma empresa (sem imagem)
  def job_list(assigns) do
    ~H"""
    <ul class="list bg-base-100 rounded-box shadow-md">
      <li class="p-4 pb-2 text-xs opacity-60 tracking-wide">Vagas mais recentes</li>

      <li
        :for={vaga <- @vagas}
        class="list-row hover:bg-base-200"
        phx-click={JS.navigate(~p"/vagas/#{vaga.id}")}
      >
        <.job_details vaga={vaga} />
      </li>
    </ul>
    """
  end

  def job_details(assigns) do
    ~H"""
    <div>
      <img
        class="size-10 rounded-box"
        src={@vaga.empresa.logo_url}
      />
    </div>
    <div class="flex flex-col flex-1 gap-1">
      <div>
        {@vaga.empresa.nome}: {@vaga.titulo} - <span class="text-secondary">{@vaga.tipo}</span>
      </div>
      <.tags tags={@vaga.tags} />
    </div>
    <div class="badge badge-soft badge-primary">R$ {@vaga.salario_reais}</div>
    <div class="badge badge-soft">{@vaga.inserted_at_formatted}</div>

    <div class="badge badge-outline">São Paulo - SP</div>
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
      {:ok,
       %{
         vagas: Vagas.list_vagas!(load: [:empresa, :tags, :salario_reais, :inserted_at_formatted])
       }}
    end)
  end
end
