defmodule VagasUniversitariasWeb.VagasLive.Index do
  use VagasUniversitariasWeb, :live_view

  alias VagasUniversitarias.Vagas

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_optional}

  def mount(_params, _session, socket) do
    vagas = Vagas.list_vagas!()

    socket =
      socket
      |> assign(page_title: "Vagas Universitárias")
      |> assign(vagas: vagas)
      |> assign(:current_user, Map.get(socket.assigns, :current_user))

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex items-center space-x-4 mb-4">
        <.button
          :if={Vagas.can_create_vaga?(@current_user)}
          phx-click={JS.navigate(~p"/vagas/new")}
          class="btn btn-primary"
        >
          <.icon name="hero-plus" class="w-4 h-4 mr-2" /> Nova Vaga
        </.button>
      </div>
      <content>
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
                src="https://play-lh.googleusercontent.com/0j6--RjOpm3uzR4GMCDK23w7X2wo2ePDzVy3wiYufzW_smS1smgldQ1aG3WQlhD2dMk=s48"
              />
            </div>
            <div class="flex flex-col flex-1 gap-1">
              <div>BTG: {vaga.titulo} - <span class="text-secondary">{vaga.tipo}</span></div>
              <div class="flex gap-2">
                <div :for={_tags <- 1..3} class="badge badge-soft badge-secundary">tag</div>
              </div>
            </div>
            <div class="badge badge-soft badge-primary">R$ 2.500,00</div>
            <div class="badge badge-outline">São Paulo - SP</div>
          </li>
        </ul>
      </content>
    </Layouts.app>
    """
  end
end
