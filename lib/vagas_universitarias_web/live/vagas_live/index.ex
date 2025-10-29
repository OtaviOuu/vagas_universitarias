defmodule VagasUniversitariasWeb.VagasLive.Index do
  use VagasUniversitariasWeb, :live_view

  alias VagasUniversitarias.Vagas

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <ul class="list bg-base-100 rounded-box shadow-md">
        <li class="p-4 pb-2 text-xs opacity-60 tracking-wide">Vagas mais recentes</li>

        <li
          :for={_song <- 1..15}
          class="list-row hover:bg-base-200"
          phx-click={JS.navigate(~p"/vagas/#{1}")}
        >
          <div>
            <img
              class="size-10 rounded-box"
              src="https://play-lh.googleusercontent.com/0j6--RjOpm3uzR4GMCDK23w7X2wo2ePDzVy3wiYufzW_smS1smgldQ1aG3WQlhD2dMk=s48"
            />
          </div>
          <div class="flex flex-col flex-1 gap-1">
            <div>BTG</div>
            <div class="flex gap-2">
              <div :for={_tags <- 1..3} class="badge badge-soft badge-secundary">estágio</div>
            </div>
          </div>
          <div class="badge badge-soft badge-primary">R$ 2.500,00</div>
          <div class="badge badge-outline">São Paulo - SP</div>
        </li>
      </ul>
    </Layouts.app>
    """
  end
end
