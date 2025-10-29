defmodule VagasUniversitariasWeb.VagasLive.Show do
  use VagasUniversitariasWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="flex gap-4">
        <div class="flex-1 space-y-4">
          <div class="card bg-base-100 shadow-md">
            <div class="card-body">
              <div class="flex items-start gap-4">
                <img
                  class="size-16 rounded-box"
                  src="https://play-lh.googleusercontent.com/0j6--RjOpm3uzR4GMCDK23w7X2wo2ePDzVy3wiYufzW_smS1smgldQ1aG3WQlhD2dMk=s48"
                />
                <div class="flex-1">
                  <h1 class="card-title text-2xl">Estágio em Tecnologia</h1>
                  <p class="text-lg opacity-80">BTG Pactual</p>
                  <div class="flex gap-2 mt-2">
                    <div class="badge badge-soft badge-primary">R$ 2.500,00</div>
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

              <div class="space-y-4">
                <div>
                  <h2 class="text-lg font-semibold mb-2">Sobre a vaga</h2>
                  <p class="opacity-80 leading-relaxed">
                    Estamos em busca de estudantes talentosos e apaixonados por tecnologia
                    para se juntar ao nosso time de desenvolvimento. Como estagiário, você
                    terá a oportunidade de trabalhar em projetos reais, aprender com
                    profissionais experientes e contribuir para soluções inovadoras no
                    mercado financeiro.
                  </p>
                </div>

                <div>
                  <h2 class="text-lg font-semibold mb-2">Responsabilidades</h2>
                  <ul class="list-disc list-inside space-y-1 opacity-80">
                    <li>Desenvolver e manter aplicações web</li>
                    <li>Participar de code reviews e pair programming</li>
                    <li>Colaborar com equipes multidisciplinares</li>
                    <li>Aprender e aplicar boas práticas de desenvolvimento</li>
                  </ul>
                </div>

                <div>
                  <h2 class="text-lg font-semibold mb-2">Requisitos</h2>
                  <ul class="list-disc list-inside space-y-1 opacity-80">
                    <li>Cursando Ciência da Computação, Engenharia ou áreas relacionadas</li>
                    <li>Conhecimento em linguagens de programação (Python, Java, JavaScript)</li>
                    <li>Inglês intermediário</li>
                    <li>Disponibilidade de 6 horas diárias</li>
                  </ul>
                </div>

                <div>
                  <h2 class="text-lg font-semibold mb-2">Benefícios</h2>
                  <ul class="list-disc list-inside space-y-1 opacity-80">
                    <li>Vale refeição e alimentação</li>
                    <li>Vale transporte</li>
                    <li>Seguro de vida</li>
                    <li>Gympass</li>
                    <li>Programa de idiomas</li>
                  </ul>
                </div>
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

          <button class="btn btn-primary btn-block">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"
              />
            </svg>
            Salvar vaga
          </button>

          <button class="btn btn-ghost btn-block" phx-click={JS.navigate(~p"/vagas")}>
            <.icon name="hero-arrow-left-solid" class="w-5 h-5" phx-click={JS.navigate(~p"/vagas")} />
            Voltar para vagas
          </button>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def handle_event("like", _value, socket) do
    {:noreply, put_flash(socket, :info, "test")}
  end
end
