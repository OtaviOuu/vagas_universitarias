defmodule VagasUniversitariasWeb.VagasLive.Show do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_optional}

  alias VagasUniversitarias.Vagas

  def mount(%{"id" => id}, _session, socket) do
    vaga = Vagas.get_vaga!(id, load: [:empresa, :salario_reais])
    IO.inspect(vaga)
    {:ok, assign(socket, vaga: vaga)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <div class="flex-1 space-y-4">
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
              <div class="flex items-start gap-4">
                <img
                  class="size-16 rounded-box"
                  src={@vaga.empresa.logo_url}
                />
                <div class="flex-1">
                  <h1 class="card-title text-2xl">{@vaga.titulo}</h1>
                  <.link
                    navigate={~p"/empresas/#{@vaga.empresa.id}"}
                    class="text-lg opacity-80 hover:underline"
                  >
                    {@vaga.empresa.nome}
                  </.link>
                  <div class="flex gap-2 mt-2">
                    <div class="badge badge-soft badge-primary">R$ {@vaga.salario_reais}</div>
                    <div class="badge badge-outline">São Paulo - SP</div>
                  </div>
                </div>
                <div class="flex items-center gap-1 text-sm opacity-80" phx-click="like">
                  10 Likes
                  <.icon name="hero-heart hover:text-red-500 hover:scale-125 hover:transition-transform cursor-pointer" />
                </div>
              </div>

              <div class="flex gap-2 mt-4">
                <div class="badge badge-soft badge-secondary">estágio</div>
                <div class="badge badge-soft badge-secondary">tecnologia</div>
                <div class="badge badge-soft badge-secondary">remoto</div>
              </div>

              <div class="divider"></div>

              <div class="space-y-4 mx-auto">
                <img src={@vaga.pdf} />
              </div>

              <div class="space-y-4">
                descr
              </div>
            </div>
          </div>
        </div>

        <div class="w-80 space-y-4">
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Detalhes</h2>
              <div class="space-y-3">
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">Candidatos</div>
                  <div class="font-medium">42 inscritos</div>
                </div>
              </div>
            </div>
          </div>

          <.button class="btn btn-primary btn-block">
            <.icon name="hero-bookmark" class="w-5 h-5 mr-2" /> Salvar vaga
          </.button>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def handle_event("like", _value, socket) do
    {:noreply, put_flash(socket, :info, "test")}
  end
end
