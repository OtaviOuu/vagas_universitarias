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
    <section class="mx-auto w-full max-w-5xl px-3 sm:px-4 lg:px-0">
      <ul class="list bg-base-100 rounded-box shadow-md">
        <%= if Enum.empty?(@vagas) do %>
          <li class="p-6 text-center text-sm text-base-content/70">
            Nenhuma vaga disponível no momento. Volte em breve!
          </li>
        <% else %>
          <li class="p-4 pb-2 text-xs opacity-60 tracking-wide">Vagas mais recentes</li>
          <li
            :for={vaga <- @vagas}
            class="list-row cursor-pointer px-4 py-3 transition hover:bg-base-200/80 focus-within:bg-base-200 sm:px-6"
            phx-click={JS.navigate(~p"/vagas/#{vaga.id}")}
          >
            <.job_details vaga={vaga} />
          </li>
        <% end %>
      </ul>
    </section>
    """
  end

  def job_details(assigns) do
    ~H"""
    <article class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between sm:gap-6">
      <div class="flex flex-1 items-start gap-4">
        <img
          class="size-14 rounded-box border border-base-200 bg-base-200/70 object-contain"
          src={@vaga.empresa.logo_url}
          alt={"Logo da empresa #{@vaga.empresa.nome}"}
        />
        <div class="space-y-1">
          <p class="text-sm font-semibold uppercase tracking-[0.3em] text-base-content/60">
            {@vaga.empresa.nome}
          </p>
          <p class="text-lg font-semibold leading-tight">{@vaga.titulo}</p>
          <p class="text-sm text-secondary">{@vaga.tipo}</p>
          <div class="pt-2">
            <.tags tags={@vaga.tags} />
          </div>
        </div>
      </div>

      <div class="flex flex-wrap items-center gap-2 text-xs sm:justify-end sm:text-sm">
        <div class="badge badge-soft badge-primary whitespace-nowrap">R$ {@vaga.salario_reais}</div>
        <div class="badge badge-soft whitespace-nowrap">{@vaga.inserted_at_formatted}</div>
        <div class="badge badge-outline whitespace-nowrap">São Paulo - SP</div>
      </div>
    </article>
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
