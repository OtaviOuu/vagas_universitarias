defmodule VagasUniversitariasWeb.PostsLive.Index do
  use VagasUniversitariasWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <div class="flex-1 space-y-4">
          <div class="tabs tabs-boxed bg-base-100 shadow-md p-2">
            <a class="tab tab-active">Popular</a>
            <a class="tab">Recente</a>
            <a class="tab">Sem resposta</a>
            <a class="tab">Respondido</a>
          </div>

          <button class="btn btn-primary btn-block" phx-click="new_post">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            Criar nova discussão
          </button>

          <div class="space-y-3" :for={_post <- 1..5} phx-click={JS.navigate(~p"/forum/topics/#{1}")}>
            <div class="card bg-base-100 shadow-md hover:shadow-lg transition-shadow cursor-pointer">
              <div class="card-body p-4">
                <div class="flex gap-4">
                  <div class="flex flex-col items-center gap-1 min-w-[40px]">
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                      </svg>
                    </button>
                    <span class="font-bold text-lg">142</span>
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                      </svg>
                    </button>
                  </div>

                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-2">
                      <div class="avatar placeholder">
                        <div class="bg-neutral text-neutral-content rounded-full w-6 h-6">
                          <span class="text-xs">JS</span>
                        </div>
                      </div>
                      <span class="text-sm font-medium">joao_silva</span>
                      <span class="text-xs opacity-60">• há 3 horas</span>
                      <div class="badge badge-primary badge-sm">Dúvida</div>
                    </div>

                    <h3 class="font-bold text-lg hover:text-primary transition-colors">
                      Como se preparar para entrevistas técnicas em Big Techs?
                    </h3>
                    <p class="text-sm opacity-80 mt-2 line-clamp-2">
                      Pessoal, estou me candidatando para vagas de estágio em empresas como Google,
                      Meta e Amazon. Queria saber de vocês que já passaram por esse processo: quais
                      são as melhores estratégias de estudo? Vale a pena fazer cursos específicos...
                    </p>

                    <div class="flex items-center gap-4 mt-3">
                      <button class="btn btn-ghost btn-xs gap-1">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
                        </svg>
                        <span>28 comentários</span>
                      </button>
                      <button class="btn btn-ghost btn-xs gap-1">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
                        </svg>
                        <span>Compartilhar</span>
                      </button>
                      <button class="btn btn-ghost btn-xs gap-1">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                        </svg>
                        <span>Salvar</span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="w-80 space-y-4">


          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Tags</h2>
              <div class="flex flex-wrap gap-2 mt-2">
                <div class="badge badge-lg" :for={_ <- 1..5}>Entrevistas</div>
              </div>
            </div>
          </div>

          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Comunidade</h2>
              <div class="stats stats-vertical shadow-sm">
                <div class="stat p-3">
                  <div class="stat-title text-xs">Membros</div>
                  <div class="stat-value text-xl">12.5k</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Online agora</div>
                  <div class="stat-value text-xl text-success">342</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Posts hoje</div>
                  <div class="stat-value text-xl">87</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
