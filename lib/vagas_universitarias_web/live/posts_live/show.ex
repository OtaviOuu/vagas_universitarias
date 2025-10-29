defmodule VagasUniversitariasWeb.PostsLive.Show do
  use VagasUniversitariasWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <!-- Coluna Principal -->
        <div class="flex-1 space-y-4">
          <!-- Botão Voltar -->
          <button class="btn btn-ghost btn-sm" phx-click={JS.navigate(~p"/forum")}>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Voltar para o fórum
          </button>

          <!-- Post Principal -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex gap-4">
                <!-- Votação -->
                <div class="flex flex-col items-center gap-2 min-w-[50px]">
                  <button class="btn btn-ghost btn-sm btn-square hover:text-primary">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                    </svg>
                  </button>
                  <span class="font-bold text-2xl">142</span>
                  <button class="btn btn-ghost btn-sm btn-square hover:text-error">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                  </button>
                </div>

                <!-- Conteúdo -->
                <div class="flex-1">
                  <!-- Header do Post -->
                  <div class="flex items-center gap-2 mb-3">
                    <div class="avatar placeholder">
                      <div class="bg-neutral text-neutral-content rounded-full w-10 h-10">
                        <span class="text-sm">JS</span>
                      </div>
                    </div>
                    <div class="flex-1">
                      <div class="flex items-center gap-2">
                        <span class="font-medium">joao_silva</span>
                        <span class="text-xs opacity-60">• há 3 horas</span>
                      </div>
                      <div class="badge badge-primary badge-sm">Dúvida</div>
                    </div>
                    <div class="dropdown dropdown-end">
                      <button class="btn btn-ghost btn-sm btn-square">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                        </svg>
                      </button>
                    </div>
                  </div>

                  <!-- Título -->
                  <h1 class="text-2xl font-bold mb-4">
                    Como se preparar para entrevistas técnicas em Big Techs?
                  </h1>

                  <!-- Conteúdo Completo -->
                  <div class="prose max-w-none">
                    <p class="opacity-80 leading-relaxed mb-4">
                      Pessoal, estou me candidatando para vagas de estágio em empresas como Google,
                      Meta e Amazon. Queria saber de vocês que já passaram por esse processo: quais
                      são as melhores estratégias de estudo? Vale a pena fazer cursos específicos?
                    </p>
                    <p class="opacity-80 leading-relaxed mb-4">
                      Atualmente estou no 3º ano de Ciência da Computação e tenho conhecimento em
                      estruturas de dados básicas, mas sinto que preciso me aprofundar muito mais.
                      Tenho cerca de 4 meses para me preparar antes das aplicações.
                    </p>
                    <p class="opacity-80 leading-relaxed">
                      Algumas dúvidas específicas:
                    </p>
                    <ul class="list-disc list-inside opacity-80 space-y-1 mb-4">
                      <li>LeetCode é suficiente ou preciso de outras plataformas?</li>
                      <li>Quanto tempo por dia vocês dedicaram aos estudos?</li>
                      <li>Como foi a parte de system design para estágios?</li>
                      <li>Algum livro ou curso específico que recomendariam?</li>
                    </ul>
                    <p class="opacity-80 leading-relaxed">
                      Qualquer dica ou experiência compartilhada será muito valiosa! 🙏
                    </p>
                  </div>

                  <!-- Ações -->
                  <div class="flex items-center gap-4 mt-6 pt-4 border-t border-base-300">
                    <button class="btn btn-ghost btn-sm gap-2">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
                      </svg>
                      <span>28 comentários</span>
                    </button>
                    <button class="btn btn-ghost btn-sm gap-2">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
                      </svg>
                      <span>Compartilhar</span>
                    </button>
                    <button class="btn btn-ghost btn-sm gap-2">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
                      </svg>
                      <span>Salvar</span>
                    </button>
                    <button class="btn btn-ghost btn-sm gap-2 ml-auto">
                      <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9" />
                      </svg>
                      <span>Reportar</span>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Ordenação de Comentários -->
          <div class="flex items-center justify-between">
            <span class="text-sm opacity-60">28 comentários</span>
            <div class="tabs tabs-boxed tabs-sm">
              <a class="tab tab-active">Mais votados</a>
              <a class="tab">Mais recentes</a>
              <a class="tab">Mais antigos</a>
            </div>
          </div>

          <!-- Campo de Novo Comentário -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex gap-3">
                <div class="avatar placeholder">
                  <div class="bg-primary text-primary-content rounded-full w-10 h-10">
                    <span class="text-sm">VC</span>
                  </div>
                </div>
                <div class="flex-1">
                  <textarea
                    class="textarea textarea-bordered w-full"
                    placeholder="Adicione um comentário..."
                    rows="3"
                  ></textarea>
                  <div class="flex justify-end gap-2 mt-2">
                    <button class="btn btn-ghost btn-sm">Cancelar</button>
                    <button class="btn btn-primary btn-sm">Comentar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Lista de Comentários -->
          <div class="space-y-4">
            <!-- Comentário 1 -->
            <div class="card bg-base-100 shadow-md">
              <div class="card-body">
                <div class="flex gap-4">
                  <!-- Votação -->
                  <div class="flex flex-col items-center gap-1 min-w-[40px]">
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                      </svg>
                    </button>
                    <span class="font-bold text-sm">45</span>
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                      </svg>
                    </button>
                  </div>

                  <!-- Conteúdo do Comentário -->
                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-2">
                      <div class="avatar placeholder">
                        <div class="bg-accent text-accent-content rounded-full w-8 h-8">
                          <span class="text-xs">MS</span>
                        </div>
                      </div>
                      <span class="font-medium text-sm">maria_dev</span>
                      <div class="badge badge-success badge-xs">TOP</div>
                      <span class="text-xs opacity-60">• há 2 horas</span>
                    </div>
                    <p class="text-sm opacity-80 leading-relaxed mb-3">
                      Passei pelo processo da Google ano passado! Minhas dicas: 1) LeetCode é essencial,
                      foque em problemas médios/difíceis; 2) O livro "Cracking the Coding Interview" é
                      obrigatório; 3) Pratique explicar seu raciocínio em voz alta; 4) System design
                      geralmente é mais leve para estágios, mas não ignore completamente. Dediquei
                      2-3h por dia durante 3 meses. Boa sorte! 🚀
                    </p>
                    <div class="flex items-center gap-3">
                      <button class="btn btn-ghost btn-xs">Responder</button>
                      <button class="btn btn-ghost btn-xs">Compartilhar</button>
                      <button class="btn btn-ghost btn-xs">Reportar</button>
                    </div>

                    <!-- Resposta aninhada -->
                    <div class="ml-6 mt-4 pl-4 border-l-2 border-base-300">
                      <div class="flex gap-3">
                        <div class="flex flex-col items-center gap-1 min-w-[30px]">
                          <button class="btn btn-ghost btn-xs btn-square">
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                            </svg>
                          </button>
                          <span class="font-bold text-xs">12</span>
                          <button class="btn btn-ghost btn-xs btn-square">
                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
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
                            <span class="font-medium text-sm">joao_silva</span>
                            <div class="badge badge-primary badge-xs">OP</div>
                            <span class="text-xs opacity-60">• há 1 hora</span>
                          </div>
                          <p class="text-sm opacity-80 leading-relaxed mb-2">
                            Muito obrigado pelas dicas! Já comecei a ler o Cracking the Coding Interview.
                            Você poderia compartilhar algum roadmap de estudo que seguiu?
                          </p>
                          <div class="flex items-center gap-3">
                            <button class="btn btn-ghost btn-xs">Responder</button>
                            <button class="btn btn-ghost btn-xs">Compartilhar</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Comentário 2 -->
            <div class="card bg-base-100 shadow-md">
              <div class="card-body">
                <div class="flex gap-4">
                  <div class="flex flex-col items-center gap-1 min-w-[40px]">
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                      </svg>
                    </button>
                    <span class="font-bold text-sm">32</span>
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                      </svg>
                    </button>
                  </div>

                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-2">
                      <div class="avatar placeholder">
                        <div class="bg-secondary text-secondary-content rounded-full w-8 h-8">
                          <span class="text-xs">PC</span>
                        </div>
                      </div>
                      <span class="font-medium text-sm">pedro_code</span>
                      <span class="text-xs opacity-60">• há 3 horas</span>
                    </div>
                    <p class="text-sm opacity-80 leading-relaxed mb-3">
                      Além do LeetCode, recomendo muito o AlgoExpert. É pago, mas tem explicações
                      em vídeo muito boas. Outra dica: pratique mock interviews com amigos ou use
                      plataformas como Pramp. A parte comportamental também é importante!
                    </p>
                    <div class="flex items-center gap-3">
                      <button class="btn btn-ghost btn-xs">Responder</button>
                      <button class="btn btn-ghost btn-xs">Compartilhar</button>
                      <button class="btn btn-ghost btn-xs">Reportar</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Comentário 3 -->
            <div class="card bg-base-100 shadow-md">
              <div class="card-body">
                <div class="flex gap-4">
                  <div class="flex flex-col items-center gap-1 min-w-[40px]">
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                      </svg>
                    </button>
                    <span class="font-bold text-sm">18</span>
                    <button class="btn btn-ghost btn-xs btn-square">
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                      </svg>
                    </button>
                  </div>

                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-2">
                      <div class="avatar placeholder">
                        <div class="bg-info text-info-content rounded-full w-8 h-8">
                          <span class="text-xs">AL</span>
                        </div>
                      </div>
                      <span class="font-medium text-sm">ana_lima</span>
                      <span class="text-xs opacity-60">• há 5 horas</span>
                    </div>
                    <p class="text-sm opacity-80 leading-relaxed mb-3">
                      Não esqueça de estudar os fundamentos! Big-O notation, recursão, árvores,
                      grafos. Muita gente foca só em resolver problemas e esquece da teoria.
                      O canal do Abdul Bari no YouTube tem excelentes explicações sobre algoritmos.
                    </p>
                    <div class="flex items-center gap-3">
                      <button class="btn btn-ghost btn-xs">Responder</button>
                      <button class="btn btn-ghost btn-xs">Compartilhar</button>
                      <button class="btn btn-ghost btn-xs">Reportar</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Botão Carregar Mais -->
            <button class="btn btn-outline btn-block">
              Carregar mais comentários (25 restantes)
            </button>
          </div>
        </div>

        <!-- Coluna Lateral -->
        <div class="w-80 space-y-4">
          <!-- Card do Autor -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Sobre o autor</h2>
              <div class="flex items-center gap-3">
                <div class="avatar placeholder">
                  <div class="bg-neutral text-neutral-content rounded-full w-12 h-12">
                    <span>JS</span>
                  </div>
                </div>
                <div class="flex-1">
                  <div class="font-medium">joao_silva</div>
                  <div class="text-xs opacity-60">Membro há 6 meses</div>
                </div>
              </div>
              <div class="stats stats-vertical shadow-sm mt-3">
                <div class="stat p-2">
                  <div class="stat-title text-xs">Karma</div>
                  <div class="stat-value text-lg">1,234</div>
                </div>
                <div class="stat p-2">
                  <div class="stat-title text-xs">Posts</div>
                  <div class="stat-value text-lg">23</div>
                </div>
                <div class="stat p-2">
                  <div class="stat-title text-xs">Comentários</div>
                  <div class="stat-value text-lg">187</div>
                </div>
              </div>
              <button class="btn btn-primary btn-sm mt-2">Ver perfil</button>
            </div>
          </div>

          <!-- Card de Posts Relacionados -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Posts relacionados</h2>
              <ul class="space-y-3 mt-2">
                <li class="text-sm hover:text-primary cursor-pointer transition-colors">
                  <div class="font-medium mb-1">Dicas para primeira entrevista técnica</div>
                  <div class="flex items-center gap-2 text-xs opacity-60">
                    <span>42 votos</span>
                    <span>•</span>
                    <span>18 comentários</span>
                  </div>
                </li>
                <div class="divider my-2"></div>
                <li class="text-sm hover:text-primary cursor-pointer transition-colors">
                  <div class="font-medium mb-1">Minha jornada até o Google: timeline completo</div>
                  <div class="flex items-center gap-2 text-xs opacity-60">
                    <span>156 votos</span>
                    <span>•</span>
                    <span>67 comentários</span>
                  </div>
                </li>
                <div class="divider my-2"></div>
                <li class="text-sm hover:text-primary cursor-pointer transition-colors">
                  <div class="font-medium mb-1">Lista de recursos para estudar algoritmos</div>
                  <div class="flex items-center gap-2 text-xs opacity-60">
                    <span>89 votos</span>
                    <span>•</span>
                    <span>34 comentários</span>
                  </div>
                </li>
              </ul>
            </div>
          </div>

          <!-- Card de Regras -->
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <h2 class="card-title text-lg">Lembre-se</h2>
              <ul class="space-y-2 text-sm opacity-80">
                <li class="flex gap-2">
                  <span>•</span>
                  <span>Seja respeitoso nos comentários</span>
                </li>
                <li class="flex gap-2">
                  <span>•</span>
                  <span>Contribua com respostas úteis</span>
                </li>
                <li class="flex gap-2">
                  <span>•</span>
                  <span>Vote em conteúdo de qualidade</span>
                </li>
                <li class="flex gap-2">
                  <span>•</span>
                  <span>Reporte conteúdo inadequado</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
