defmodule VagasUniversitariasWeb.UserProfileLive.New do
  use VagasUniversitariasWeb, :live_view

  alias VagasUniversitarias.Profiles

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_required_without_profile}

  def mount(_params, _session, socket) do
    new_user_profile =
      Profiles.form_to_create_user_profile(actor: socket.assigns.current_user) |> to_form()

    socket =
      socket
      |> assign(page_title: "Criar Perfil")
      |> assign(new_user_profile: new_user_profile)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="max-w-3xl mx-auto">
        <div class="mb-6">
          <h1 class="text-3xl font-bold">Criar Seu Perfil</h1>
        </div>

        <div class="card bg-base-100 shadow-xl">
          <div class="card-body">
            <.form for={@new_user_profile} phx-submit="save" class="space-y-6">
              <!-- Nome Completo -->
              <div class="form-control">
                <.input
                  type="text"
                  field={@new_user_profile[:full_name]}
                  label="Nome Completo"
                  placeholder="Ex: João da Silva"
                  class="input input-bordered w-full"
                />
              </div>
              
    <!-- Curso -->
              <div class="form-control">
                <.input
                  type="text"
                  field={@new_user_profile[:nick_name]}
                  label="Nick Name"
                  placeholder="Ex: joaosilva123"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <.input
                  type="text"
                  field={@new_user_profile[:bio]}
                  label="Bio"
                  placeholder="Ex: Estudante de Ciência da Computação"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="form-control">
                <.input
                  type="text"
                  field={@new_user_profile[:avatar_url]}
                  label="URL do Avatar"
                  placeholder="Ex: https://example.com/avatar.jpg"
                  class="input input-bordered w-full"
                />
              </div>

              <div class="divider"></div>

              <div class="flex gap-3 pt-4">
                <button
                  type="button"
                  class="btn btn-ghost flex-1"
                  phx-click={JS.navigate(~p"/")}
                >
                  <.icon name="hero-x-mark" class="w-5 h-5" /> Cancelar
                </button>
                <button type="submit" class="btn btn-primary flex-1">
                  <.icon name="hero-check" class="w-5 h-5" /> Criar Perfil
                </button>
              </div>
            </.form>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  def handle_event("save", %{"form" => perfil_params}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.new_user_profile,
           params: perfil_params |> Map.put("user_id", socket.assigns.current_user.id)
         ) do
      {:ok, _perfil} ->
        {:noreply,
         socket
         |> put_flash(:info, "Perfil criado com sucesso!")
         |> push_navigate(to: ~p"/user/profile")}

      {:error, form} ->
        IO.inspect(form)
        {:noreply, assign(socket, new_user_profile: form |> to_form())}
    end
  end
end
