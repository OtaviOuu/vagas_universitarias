defmodule VagasUniversitariasWeb.EmpresasLive.New do
  use VagasUniversitariasWeb, :live_view

  alias VagasUniversitarias.Vagas

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_admin_required}

  def mount(_params, _session, socket) do
    new_empresa_form = Vagas.form_to_create_empresa(actor: socket.assigns.current_user) |> to_form

    socket =
      socket
      |> assign(page_title: "Criar Nova Empresa")
      |> assign(new_empresa_form: new_empresa_form)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="max-w-3xl mx-auto">
        <div class="mb-6">
          <h1 class="text-3xl font-bold">Criar Nova Empresa</h1>
        </div>

        <div class="card bg-base-100 shadow-xl">
          <div class="card-body">
            <.form for={@new_empresa_form} phx-submit="save" class="space-y-6">
              <div class="form-control">
                <.input
                  type="text"
                  field={@new_empresa_form[:nome]}
                  label="Título da Empresa"
                  placeholder="Ex: Empresa XYZ"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <.input
                  type="text"
                  field={@new_empresa_form[:logo_url]}
                  label="Logo da Empresa"
                  placeholder="URL do logo da empresa"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="divider"></div>

              <div class="flex gap-3 pt-4">
                <button
                  type="button"
                  class="btn btn-ghost flex-1"
                  phx-click={JS.navigate(~p"/vagas")}
                >
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M6 18L18 6M6 6l12 12"
                    />
                  </svg>
                  Cancelar
                </button>
                <button type="submit" class="btn btn-primary flex-1">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M5 13l4 4L19 7"
                    />
                  </svg>
                  Criar Vaga
                </button>
              </div>
            </.form>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def handle_event("save", %{"form" => vaga_params}, socket) do
    IO.inspect(socket.assigns.current_user)

    case AshPhoenix.Form.submit(socket.assigns.new_empresa_form,
           params: vaga_params
         ) do
      {:ok, _vaga} ->
        {:noreply,
         socket
         |> put_flash(:info, "Vaga criada com sucesso!")
         |> push_navigate(to: ~p"/vagas")}

      {:error, form} ->
        {:noreply, assign(socket, new_empresa_form: to_form(form))}
    end
  end
end
