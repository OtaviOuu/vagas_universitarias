defmodule VagasUniversitariasWeb.PostsLive.New do
  use VagasUniversitariasWeb, :live_view

  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_user_required_with_profile}

  alias VagasUniversitarias.Social

  def mount(_params, _session, socket) do
    user = socket.assigns.current_user
    new_post_form = Social.form_to_create_post(actor: user.user_profile) |> to_form

    {:ok, socket |> assign(new_post_form: new_post_form)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <div class="max-w-3xl mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Criar nova discussão</h1>
        <.form for={@new_post_form} phx-submit="save" class="space-y-6">
          <!-- Título -->

          <div class="form-control">
            <.input
              type="text"
              field={@new_post_form[:title]}
              label="Título da Vaga"
              placeholder="Ex: Post titulo"
              class="input input-bordered w-full"
            />
          </div>

          <div class="form-control">
            <.input
              type="text"
              field={@new_post_form[:body]}
              label="Post body"
              placeholder="Ex: Titulo"
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
              <.icon name="hero-plus-solid" class="w-4 h-4 mr-2" /> Criar Vaga
            </button>
          </div>
        </.form>
      </div>
    </Layouts.app>
    """
  end

  def handle_event("save", %{"form" => post_params}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.new_post_form,
           params: post_params
         ) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post criado com sucesso!")
         |> push_navigate(to: ~p"/forum/topics")}

      {:error, form} ->
        IO.inspect(form.errors, label: "Form errors")
        {:noreply, assign(socket, new_post_form: to_form(form))}
    end
  end
end
