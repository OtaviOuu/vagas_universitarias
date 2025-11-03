defmodule VagasUniversitariasWeb.LiveUserAuth do
  @moduledoc """
  Helpers for authenticating users in LiveViews.
  """

  import Phoenix.Component
  use VagasUniversitariasWeb, :verified_routes

  # This is used for nested liveviews to fetch the current user.
  # To use, place the following at the top of that liveview:
  # on_mount {VagasUniversitariasWeb.LiveUserAuth, :current_user}
  def on_mount(:current_user, _params, session, socket) do
    {:cont, AshAuthentication.Phoenix.LiveSession.assign_new_resources(socket, session)}
  end

  def on_mount(:live_user_optional, _params, _session, socket) do
    if socket.assigns[:current_user] do
      {:cont, socket}
    else
      {:cont, assign(socket, :current_user, nil)}
    end
  end

  def on_mount(:live_user_required, _params, _session, socket) do
    if socket.assigns[:current_user] do
      {:cont, socket}
    else
      {:halt, Phoenix.LiveView.redirect(socket, to: ~p"/sign-in")}
    end
  end

  def on_mount(:live_user_required_without_profile, _params, _session, socket) do
    if socket.assigns[:current_user] do
      if !socket.assigns[:current_user].user_profile do
        {:cont, socket}
      else
        socket =
          socket
          |> Phoenix.LiveView.put_flash(
            :info,
            "Você já possui um perfil de usuário."
          )
          |> Phoenix.LiveView.redirect(to: ~p"/user/profile")

        {:halt, socket}
      end
    else
      socket =
        socket
        |> Phoenix.LiveView.put_flash(
          :info,
          "Você precisa estar logado para acessar esta página."
        )
        |> Phoenix.LiveView.redirect(to: ~p"/sign-in")

      {:halt, socket}
    end
  end

  def on_mount(:live_user_required_with_profile, _params, _session, socket) do
    if socket.assigns[:current_user] do
      case socket.assigns[:current_user].user_profile do
        nil ->
          socket =
            socket
            |> Phoenix.LiveView.put_flash(
              :error,
              "Você precisa completar seu perfil."
            )
            |> Phoenix.LiveView.redirect(to: ~p"/user/profile/new")

          {:halt, socket}

        _profile ->
          {:cont, socket}
      end
    else
      socket =
        socket
        |> Phoenix.LiveView.put_flash(
          :info,
          "Você precisa estar logado para acessar esta página."
        )
        |> Phoenix.LiveView.redirect(to: ~p"/sign-in")

      {:halt, socket}
    end
  end

  def on_mount(:live_admin_required, _params, _session, socket) do
    if socket.assigns[:current_user] && socket.assigns[:current_user].role == :admin do
      {:cont, socket}
    else
      socket =
        socket
        |> Phoenix.LiveView.put_flash(
          :error,
          "Você precisa ser um administrador para acessar esta página."
        )
        |> Phoenix.LiveView.redirect(to: ~p"/vagas")

      {:halt, socket}
    end
  end

  def on_mount(:live_no_user, _params, _session, socket) do
    if socket.assigns[:current_user] do
      {:halt, Phoenix.LiveView.redirect(socket, to: ~p"/")}
    else
      {:cont, assign(socket, :current_user, nil)}
    end
  end
end
