defmodule VagasUniversitariasWeb.VagasLive.Show do
  use VagasUniversitariasWeb, :live_view

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
              <h2 class="card-title text-lg">Sobre a empresa</h2>
              <div class="space-y-3">
                <div class="flex items-center gap-2">
                  <svg
                    class="w-5 h-5 opacity-60"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"
                    />
                  </svg>
                  <span class="opacity-80">Serviços Financeiros</span>
                </div>
                <div class="flex items-center gap-2">
                  <svg
                    class="w-5 h-5 opacity-60"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                    />
                  </svg>
                  <span class="opacity-80">5.000+ funcionários</span>
                </div>
                <div class="flex items-center gap-2">
                  <svg
                    class="w-5 h-5 opacity-60"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"
                    />
                  </svg>
                  <span class="opacity-80">www.btgpactual.com</span>
                </div>
              </div>
            </div>
          </div>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Detalhes</h2>
              <div class="space-y-3">
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">Modalidade</div>
                  <div class="font-medium">Híbrido</div>
                </div>
                <div class="divider my-2"></div>
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">Carga horária</div>
                  <div class="font-medium">6 horas/dia</div>
                </div>
                <div class="divider my-2"></div>
                <div>
                  <div class="text-xs opacity-60 uppercase tracking-wide mb-1">
                    Data de publicação
                  </div>
                  <div class="font-medium">Há 2 dias</div>
                </div>
                <div class="divider my-2"></div>
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
