defmodule VagasUniversitariasWeb.UserProfileLive.Show do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_required}

  def mount(_params, _session, socket) do
    IO.inspect(socket, label: "Current User in UserProfileLive.Show")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <div class="flex-1 space-y-4">
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex items-start gap-4">
                <div class="avatar">
                  <div class="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
                    <img src="https://ui-avatars.com/api/?name=Usuario&size=128&background=random" />
                  </div>
                </div>
                <div class="flex-1">
                  <div class="flex items-center gap-2">
                    <h1 class="text-2xl font-bold">{@current_user.email}</h1>
                    <div class="badge badge-success badge-sm">Ativo</div>
                  </div>
                  <p class="text-sm opacity-60 mt-1">{@current_user.email}</p>
                  <p class="mt-3 opacity-80">
                    Estudante de Ciência da Computação apaixonado por tecnologia e inovação.
                    Buscando oportunidades de estágio para aplicar conhecimentos e crescer profissionalmente.
                  </p>
                </div>
                <button class="btn btn-outline btn-sm">Editar Perfil</button>
              </div>
            </div>
          </div>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title">Informações Acadêmicas</h2>
              <div class="space-y-4 mt-2">
                <div class="flex items-start gap-3">
                  <svg class="w-6 h-6 opacity-60 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                  </svg>
                  <div class="flex-1">
                    <div class="font-semibold">Universidade de São Paulo (USP)</div>
                    <div class="text-sm opacity-70">Ciência da Computação • 3º ano</div>
                    <div class="text-sm opacity-60">Previsão de conclusão: Dez/2026</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title">Habilidades</h2>
              <div class="flex flex-wrap gap-2 mt-2">
                <div class="badge badge-lg badge-primary">Elixir</div>
                <div class="badge badge-lg badge-primary">Phoenix</div>
                <div class="badge badge-lg badge-primary">JavaScript</div>
                <div class="badge badge-lg badge-primary">React</div>
                <div class="badge badge-lg badge-primary">Python</div>
                <div class="badge badge-lg badge-primary">SQL</div>
                <div class="badge badge-lg badge-primary">Git</div>
                <div class="badge badge-lg badge-primary">Docker</div>
              </div>
              <button class="btn btn-ghost btn-sm mt-2 self-start">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                </svg>
                Adicionar habilidade
              </button>
            </div>
          </div>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title">Experiência</h2>
              <div class="space-y-4 mt-2">
                <div class="flex gap-3">
                  <div class="avatar placeholder">
                    <div class="bg-neutral text-neutral-content rounded-lg w-12 h-12">
                      <span class="text-xl">T</span>
                    </div>
                  </div>
                  <div class="flex-1">
                    <div class="font-semibold">Desenvolvedor Voluntário</div>
                    <div class="text-sm opacity-70">Tech for Good • 6 meses</div>
                    <div class="text-sm opacity-80 mt-1">
                      Desenvolvimento de aplicações web para ONGs utilizando React e Node.js
                    </div>
                  </div>
                </div>
              </div>
              <button class="btn btn-ghost btn-sm mt-2 self-start">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                </svg>
                Adicionar experiência
              </button>
            </div>
          </div>
        </div>

        <div class="w-80 space-y-4">
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Estatísticas</h2>
              <div class="stats stats-vertical shadow-sm">
                <div class="stat p-4">
                  <div class="stat-title text-xs">Candidaturas</div>
                  <div class="stat-value text-2xl text-primary">12</div>
                  <div class="stat-desc">+3 esta semana</div>
                </div>
                <div class="stat p-4">
                  <div class="stat-title text-xs">Vagas salvas</div>
                  <div class="stat-value text-2xl text-secondary">8</div>
                  <div class="stat-desc">2 novas hoje</div>
                </div>
                <div class="stat p-4">
                  <div class="stat-title text-xs">Respostas</div>
                  <div class="stat-value text-2xl text-accent">5</div>
                  <div class="stat-desc">41% taxa de resposta</div>
                </div>
              </div>
            </div>
          </div>

          <div class="flex justify-center">
            <button class="btn btn-primary w-full" phx-click={JS.navigate(~p"/vagas")}>
              Ver todas as vagas
            </button>
          </div>



          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex items-center justify-between">
                <h2 class="card-title text-lg">Vagas Favoritas</h2>
                <button class="btn btn-ghost btn-xs" phx-click={JS.navigate(~p"/vagas/favoritas")}>
                  Ver todas
                </button>
              </div>

              <ul class="space-y-2 mt-2">
                <li
                  class="flex items-center gap-3 p-3 rounded-lg hover:bg-base-200 cursor-pointer transition-colors"
                  phx-click={JS.navigate(~p"/vagas/#{1}")}
                  :for={_vaga <- 1..3}
                >
                  <img
                    class="size-10 rounded-box"
                    src="https://play-lh.googleusercontent.com/0j6--RjOpm3uzR4GMCDK23w7X2wo2ePDzVy3wiYufzW_smS1smgldQ1aG3WQlhD2dMk=s48"
                  />
                  <div class="flex-1 min-w-0">
                    <div class="font-medium text-sm truncate">Estágio em Tech</div>
                    <div class="text-xs opacity-60">BTG Pactual</div>
                  </div>
                  <button class="btn btn-ghost btn-xs btn-square">
                    <svg class="w-4 h-4 fill-current text-error" viewBox="0 0 24 24">
                      <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
                    </svg>
                  </button>
                </li>
              </ul>

              <div class="text-center text-xs opacity-60 mt-3">
                8 vagas salvas no total
              </div>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
