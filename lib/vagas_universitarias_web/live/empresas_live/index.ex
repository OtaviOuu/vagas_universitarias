defmodule VagasUniversitariasWeb.EmpresasLive.Index do
  use VagasUniversitariasWeb, :live_view

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
            <div class="form-control">
              <div class="input-group">
                <input type="text" placeholder="Buscar empresas..." class="input input-bordered" />
                <button class="btn btn-square btn-primary">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </button>
              </div>
            </div>
          </div>

          <!-- Filtros -->
          <div class="flex gap-3 flex-wrap">
            <select class="select select-bordered select-sm">
              <option selected>Todos os setores</option>
              <option>Tecnologia</option>
              <option>Financeiro</option>
              <option>Varejo</option>
              <option>Saúde</option>
              <option>Educação</option>
            </select>
            <select class="select select-bordered select-sm">
              <option selected>Qualquer tamanho</option>
              <option>Startup (1-50)</option>
              <option>Médio Porte (51-500)</option>
              <option>Grande Porte (500+)</option>
            </select>
            <select class="select select-bordered select-sm">
              <option selected>Ordenar por: Destaque</option>
              <option>Mais vagas</option>
              <option>Melhor avaliadas</option>
              <option>Mais seguidas</option>
            </select>
          </div>

          <!-- Grid de Empresas -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <!-- Empresa 1 - BTG -->
            <div class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer" phx-click={JS.navigate(~p"/empresas/#{1}")}>
              <div class="card-body">
                <div class="flex items-start gap-4">
                  <div class="avatar">
                    <div class="w-16 h-16 rounded-box">
                      <img src="https://play-lh.googleusercontent.com/0j6--RjOpm3uzR4GMCDK23w7X2wo2ePDzVy3wiYufzW_smS1smgldQ1aG3WQlhD2dMk=s64" />
                    </div>
                  </div>
                  <div class="flex-1">
                    <h3 class="card-title text-lg">BTG Pactual</h3>
                    <p class="text-sm opacity-60">Serviços Financeiros</p>
                  </div>
                  <button class="btn btn-ghost btn-sm btn-square">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                    </svg>
                  </button>
                </div>

                <p class="text-sm opacity-80 mt-2 line-clamp-2">
                  Maior banco de investimentos da América Latina com cultura de meritocracia e inovação.
                </p>

                <div class="divider my-2"></div>

                <!-- Reputação e Métricas -->
                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="rating rating-sm">
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" checked disabled />
                    </div>
                    <span class="text-sm font-bold">4.8</span>
                    <span class="text-xs opacity-60">(234)</span>
                  </div>
                  <div class="badge badge-success gap-1">
                    <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                    </svg>
                    Top 10
                  </div>
                </div>

                <div class="flex gap-4 mt-3">
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Vagas Abertas</div>
                    <div class="font-bold text-primary">8 vagas</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Seguidores</div>
                    <div class="font-bold">2.3k</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Funcionários</div>
                    <div class="font-bold">5k+</div>
                  </div>
                </div>

                <div class="flex gap-2 mt-3">
                  <div class="badge badge-sm badge-outline">Híbrido</div>
                  <div class="badge badge-sm badge-outline">São Paulo</div>
                  <div class="badge badge-sm badge-primary">Contratando</div>
                </div>
              </div>
            </div>

            <!-- Empresa 2 - Nubank -->
            <div class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer" phx-click={JS.navigate(~p"/empresas/#{2}")}>
              <div class="card-body">
                <div class="flex items-start gap-4">
                  <div class="avatar">
                    <div class="w-16 h-16 rounded-box">
                      <img src="https://ui-avatars.com/api/?name=NU&size=64&background=8A05BE&color=fff&bold=true" />
                    </div>
                  </div>
                  <div class="flex-1">
                    <h3 class="card-title text-lg">Nubank</h3>
                    <p class="text-sm opacity-60">Fintech</p>
                  </div>
                  <button class="btn btn-ghost btn-sm btn-square">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                    </svg>
                  </button>
                </div>

                <p class="text-sm opacity-80 mt-2 line-clamp-2">
                  Maior fintech da América Latina revolucionando serviços financeiros com tecnologia de ponta.
                </p>

                <div class="divider my-2"></div>

                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="rating rating-sm">
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" checked disabled />
                    </div>
                    <span class="text-sm font-bold">4.9</span>
                    <span class="text-xs opacity-60">(567)</span>
                  </div>
                  <div class="badge badge-success gap-1">
                    <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                    </svg>
                    Top 5
                  </div>
                </div>

                <div class="flex gap-4 mt-3">
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Vagas Abertas</div>
                    <div class="font-bold text-primary">15 vagas</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Seguidores</div>
                    <div class="font-bold">8.7k</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Funcionários</div>
                    <div class="font-bold">7k+</div>
                  </div>
                </div>

                <div class="flex gap-2 mt-3">
                  <div class="badge badge-sm badge-outline">Remoto</div>
                  <div class="badge badge-sm badge-outline">São Paulo</div>
                  <div class="badge badge-sm badge-primary">Contratando</div>
                </div>
              </div>
            </div>

            <!-- Empresa 3 - Itaú -->
            <div class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer" phx-click={JS.navigate(~p"/empresas/#{3}")}>
              <div class="card-body">
                <div class="flex items-start gap-4">
                  <div class="avatar">
                    <div class="w-16 h-16 rounded-box">
                      <img src="https://ui-avatars.com/api/?name=IT&size=64&background=FF6900&color=fff&bold=true" />
                    </div>
                  </div>
                  <div class="flex-1">
                    <h3 class="card-title text-lg">Itaú Unibanco</h3>
                    <p class="text-sm opacity-60">Banco</p>
                  </div>
                  <button class="btn btn-ghost btn-sm btn-square">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                    </svg>
                  </button>
                </div>

                <p class="text-sm opacity-80 mt-2 line-clamp-2">
                  Maior banco privado do Brasil com forte investimento em transformação digital e inovação.
                </p>

                <div class="divider my-2"></div>

                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="rating rating-sm">
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" checked disabled />
                      <input type="radio" class="mask mask-star-2 bg-base-300" disabled />
                    </div>
                    <span class="text-sm font-bold">4.3</span>
                    <span class="text-xs opacity-60">(892)</span>
                  </div>
                  <div class="badge badge-info gap-1">
                    Destaque
                  </div>
                </div>

                <div class="flex gap-4 mt-3">
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Vagas Abertas</div>
                    <div class="font-bold text-primary">23 vagas</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Seguidores</div>
                    <div class="font-bold">5.1k</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Funcionários</div>
                    <div class="font-bold">90k+</div>
                  </div>
                </div>

                <div class="flex gap-2 mt-3">
                  <div class="badge badge-sm badge-outline">Híbrido</div>
                  <div class="badge badge-sm badge-outline">Multiple</div>
                  <div class="badge badge-sm badge-primary">Contratando</div>
                </div>
              </div>
            </div>

            <!-- Empresa 4 - Magazine Luiza -->
            <div class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer" phx-click={JS.navigate(~p"/empresas/#{4}")}>
              <div class="card-body">
                <div class="flex items-start gap-4">
                  <div class="avatar">
                    <div class="w-16 h-16 rounded-box">
                      <img src="https://ui-avatars.com/api/?name=MG&size=64&background=0086FF&color=fff&bold=true" />
                    </div>
                  </div>
                  <div class="flex-1">
                    <h3 class="card-title text-lg">Magazine Luiza</h3>
                    <p class="text-sm opacity-60">Varejo & E-commerce</p>
                  </div>
                  <button class="btn btn-ghost btn-sm btn-square">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                    </svg>
                  </button>
                </div>

                <p class="text-sm opacity-80 mt-2 line-clamp-2">
                  Líder em varejo omnichannel com forte cultura de diversidade e desenvolvimento de talentos.
                </p>

                <div class="divider my-2"></div>

                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="rating rating-sm">
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" checked disabled />
                      <input type="radio" class="mask mask-star-2 bg-base-300" disabled />
                    </div>
                    <span class="text-sm font-bold">4.5</span>
                    <span class="text-xs opacity-60">(423)</span>
                  </div>
                  <div class="badge badge-secondary gap-1">
                    Diversidade
                  </div>
                </div>

                <div class="flex gap-4 mt-3">
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Vagas Abertas</div>
                    <div class="font-bold text-primary">12 vagas</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Seguidores</div>
                    <div class="font-bold">3.2k</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Funcionários</div>
                    <div class="font-bold">50k+</div>
                  </div>
                </div>

                <div class="flex gap-2 mt-3">
                  <div class="badge badge-sm badge-outline">Híbrido</div>
                  <div class="badge badge-sm badge-outline">São Paulo</div>
                  <div class="badge badge-sm badge-primary">Contratando</div>
                </div>
              </div>
            </div>

            <!-- Empresa 5 - Mercado Livre -->
            <div class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer" phx-click={JS.navigate(~p"/empresas/#{5}")}>
              <div class="card-body">
                <div class="flex items-start gap-4">
                  <div class="avatar">
                    <div class="w-16 h-16 rounded-box">
                      <img src="https://ui-avatars.com/api/?name=ML&size=64&background=FFE600&color=000&bold=true" />
                    </div>
                  </div>
                  <div class="flex-1">
                    <h3 class="card-title text-lg">Mercado Livre</h3>
                    <p class="text-sm opacity-60">E-commerce & Fintech</p>
                  </div>
                  <button class="btn btn-ghost btn-sm btn-square">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                    </svg>
                  </button>
                </div>

                <p class="text-sm opacity-80 mt-2 line-clamp-2">
                  Maior plataforma de e-commerce da América Latina com oportunidades em tecnologia e logística.
                </p>

                <div class="divider my-2"></div>

                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="rating rating-sm">
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" checked disabled />
                    </div>
                    <span class="text-sm font-bold">4.7</span>
                    <span class="text-xs opacity-60">(678)</span>
                  </div>
                  <div class="badge badge-success gap-1">
                    <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                    </svg>
                    Top 15
                  </div>
                </div>

                <div class="flex gap-4 mt-3">
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Vagas Abertas</div>
                    <div class="font-bold text-primary">19 vagas</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Seguidores</div>
                    <div class="font-bold">6.5k</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Funcionários</div>
                    <div class="font-bold">20k+</div>
                  </div>
                </div>

                <div class="flex gap-2 mt-3">
                  <div class="badge badge-sm badge-outline">Remoto</div>
                  <div class="badge badge-sm badge-outline">Multiple</div>
                  <div class="badge badge-sm badge-primary">Contratando</div>
                </div>
              </div>
            </div>

            <!-- Empresa 6 - Stone -->
            <div class="card bg-base-100 shadow-md hover:shadow-xl transition-shadow cursor-pointer" phx-click={JS.navigate(~p"/empresas/#{6}")}>
              <div class="card-body">
                <div class="flex items-start gap-4">
                  <div class="avatar">
                    <div class="w-16 h-16 rounded-box">
                      <img src="https://ui-avatars.com/api/?name=ST&size=64&background=00A868&color=fff&bold=true" />
                    </div>
                  </div>
                  <div class="flex-1">
                    <h3 class="card-title text-lg">Stone</h3>
                    <p class="text-sm opacity-60">Fintech & Pagamentos</p>
                  </div>
                  <button class="btn btn-ghost btn-sm btn-square">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                    </svg>
                  </button>
                </div>

                <p class="text-sm opacity-80 mt-2 line-clamp-2">
                  Empresa de tecnologia focada em soluções de pagamento com cultura ágil e inovadora.
                </p>

                <div class="divider my-2"></div>

                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <div class="rating rating-sm">
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-warning" disabled />
                      <input type="radio" class="mask mask-star-2 bg-base-300" checked disabled />
                    </div>
                    <span class="text-sm font-bold">4.6</span>
                    <span class="text-xs opacity-60">(312)</span>
                  </div>
                  <div class="badge badge-warning gap-1">
                    Startup
                  </div>
                </div>

                <div class="flex gap-4 mt-3">
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Vagas Abertas</div>
                    <div class="font-bold text-primary">7 vagas</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Seguidores</div>
                    <div class="font-bold">1.8k</div>
                  </div>
                  <div class="flex-1">
                    <div class="text-xs opacity-60">Funcionários</div>
                    <div class="font-bold">3k+</div>
                  </div>
                </div>

                <div class="flex gap-2 mt-3">
                  <div class="badge badge-sm badge-outline">Híbrido</div>
                  <div class="badge badge-sm badge-outline">Rio de Janeiro</div>
                  <div class="badge badge-sm badge-primary">Contratando</div>
                </div>
              </div>
            </div>
          </div>

          <!-- Paginação -->
          <div class="flex justify-center mt-8">
            <div class="join">
              <button class="join-item btn">«</button>
              <button class="join-item btn btn-active">1</button>
              <button class="join-item btn">2</button>
              <button class="join-item btn">3</button>
              <button class="join-item btn">4</button>
              <button class="join-item btn">»</button>
            </div>
          </div>
        </div>

        <!-- Coluna Lateral -->
        <div class="w-80 space-y-4">
          <!-- Card de Destaque -->
          <div class="card bg-gradient-to-br from-primary to-secondary text-primary-content shadow-xl">
            <div class="card-body">
              <h2 class="card-title">🏆 Top Empresas 2024</h2>
              <p class="text-sm">
                Conheça as empresas mais bem avaliadas pelos estudantes este ano!
              </p>
              <button class="btn btn-sm mt-2">Ver Ranking</button>
            </div>
          </div>

          <!-- Card de Filtros Rápidos -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Filtros Rápidos</h2>
              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-3">
                  <input type="checkbox" class="checkbox checkbox-sm" />
                  <span class="label-text">Apenas remotas</span>
                </label>
              </div>
              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-3">
                  <input type="checkbox" class="checkbox checkbox-sm" />
                  <span class="label-text">Com vagas abertas</span>
                </label>
              </div>
              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-3">
                  <input type="checkbox" class="checkbox checkbox-sm" />
                  <span class="label-text">Top 50</span>
                </label>
              </div>
              <div class="form-control">
                <label class="label cursor-pointer justify-start gap-3">
                  <input type="checkbox" class="checkbox checkbox-sm" />
                  <span class="label-text">Startups</span>
                </label>
              </div>
            </div>
          </div>

          <!-- Card de Estatísticas -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Estatísticas</h2>
              <div class="stats stats-vertical shadow-sm">
                <div class="stat p-3">
                  <div class="stat-title text-xs">Empresas Ativas</div>
                  <div class="stat-value text-2xl">342</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Total de Vagas</div>
                  <div class="stat-value text-2xl text-primary">1.2k</div>
                </div>
                <div class="stat p-3">
                  <div class="stat-title text-xs">Avaliações</div>
                  <div class="stat-value text-2xl">4.5k</div>
                </div>
              </div>
            </div>
          </div>

          <!-- Card de Setores Populares -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Setores Populares</h2>
              <div class="flex flex-wrap gap-2 mt-2">
                <div class="badge badge-lg">Tecnologia</div>
                <div class="badge badge-lg">Financeiro</div>
                <div class="badge badge-lg">E-commerce</div>
                <div class="badge badge-lg">Consultoria</div>
                <div class="badge badge-lg">Saúde</div>
                <div class="badge badge-lg">Educação</div>
              </div>
            </div>
          </div>

          <!-- Card de Dicas -->
          <div class="alert alert-info shadow-lg">
            <svg class="w-6 h-6 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <div>
              <h3 class="font-bold text-sm">Dica</h3>
              <div class="text-xs">Siga empresas para receber notificações sobre novas vagas!</div>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
