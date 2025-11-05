defmodule VagasUniversitariasWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use VagasUniversitariasWeb, :html
  alias VagasUniversitarias.Vagas

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="navbar bg-base-100 shadow-sm">
      <div class="navbar-start">
        <ul class="menu menu-horizontal px-1 gap-2 text-sm font-medium">
          <%= if @current_user do %>
            <li>
              <.link
                :if={@current_user.role == :admin}
                navigate={~p"/admin/home"}
                class="btn btn-ghost normal-case text-sm ml-2"
              >
                Admin
              </.link>
            </li>
          <% else %>
            <.link navigate={~p"/sign-in"} class="btn btn-ghost normal-case text-sm ml-2">
              Login
            </.link>
            <.link navigate={~p"/register"} class="btn btn-ghost normal-case text-sm ml-2">
              Criar Conta
            </.link>
          <% end %>
          <.link navigate={~p"/empresas"} class="btn btn-ghost normal-case text-sm ml-2">
            Empresas
          </.link>
          <.link navigate={~p"/vagas"} class="btn btn-ghost normal-case text-sm ml-2">
            Vagas
          </.link>
          <.link navigate={~p"/forum/topics"} class="btn btn-ghost normal-case text-sm ml-2">
            Forum
          </.link>
        </ul>
      </div>

      <div class="navbar-center">
        <.link navigate={~p"/"} class="btn btn-ghost text-xl">Projetin</.link>
      </div>

      <div class="navbar-end">
        <button class="btn btn-ghost btn-circle">
          <.icon name="hero-magnifying-glass" class="size-5" />
        </button>
        <button class="btn btn-ghost btn-circle">
          <div class="indicator">
            <.icon name="hero-bell" class="size-5" />
            <span class="badge badge-xs badge-primary indicator-item"></span>
          </div>
        </button>
        <.button
          :if={@current_user}
          class="btn btn-ghost btn-circle"
          phx-click={JS.navigate(~p"/user/profile")}
        >
          <div class="avatar">
            <div class="rounded-full">
              <img src="https://img.daisyui.com/images/profile/demo/yellingcat@192.webp" />
            </div>
          </div>
        </.button>
      </div>
    </header>

    <main class="px-4 sm:px-6 lg:px-8">
      <div class="min-h-screen py-8 max-w-6xl mx-auto">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />
    """
  end

  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  attr :current_user, :map, default: nil, doc: "the current admin user"
  slot :inner_block, required: true

  def admin_layout(assigns) do
    ~H"""
    <div class="drawer lg:drawer-open">
      <input id="admin-drawer" type="checkbox" class="drawer-toggle" />
      <div class="drawer-content flex flex-col">
        <header class="navbar bg-base-100 shadow-sm border-b border-base-300">
          <div class="flex-none lg:hidden">
            <label for="admin-drawer" class="btn btn-ghost btn-circle">
              <.icon name="hero-bars-3" class="size-5" />
            </label>
          </div>
          <div class="flex-1">
            <span class="text-xl font-semibold ml-2">Admin Dashboard</span>
          </div>
          <div class="flex-none gap-2">
            <button class="btn btn-ghost btn-circle">
              <.icon name="hero-magnifying-glass" class="size-5" />
            </button>
            <button class="btn btn-ghost btn-circle">
              <div class="indicator">
                <.icon name="hero-bell" class="size-5" />
                <span class="badge badge-xs badge-error indicator-item"></span>
              </div>
            </button>
            <div class="dropdown dropdown-end">
              <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                <div class="w-10 rounded-full">
                  <img src="https://img.daisyui.com/images/profile/demo/yellingcat@192.webp" />
                </div>
              </div>
              <ul
                tabindex="-1"
                class="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow-lg border border-base-300"
              >
                <li><.link navigate={~p"/vagas"}>Ver Site</.link></li>
                <li><.link navigate={~p"/admin/profile"}>Perfil</.link></li>
                <li><.link navigate={~p"/admin/settings"}>Configurações</.link></li>
                <li><hr class="my-1" /></li>
                <li>
                  <.link href={~p"/logout"} method="delete">Sair</.link>
                </li>
              </ul>
            </div>
          </div>
        </header>

        <main class="flex-1 overflow-y-auto bg-base-200">
          <div class="p-6 max-w-7xl mx-auto">
            {render_slot(@inner_block)}
          </div>
        </main>
      </div>

      <div class="drawer-side z-10">
        <label for="admin-drawer" class="drawer-overlay"></label>
        <aside class="bg-base-100 w-64 min-h-screen shadow-xl">
          <div class="p-4 border-b border-base-300">
            <.link navigate={~p"/"} class="flex items-center gap-2">
              <span class="text-2xl font-bold">Projetin</span>
              <span class="badge badge-sm badge-primary">Admin</span>
            </.link>
          </div>

          <ul class="menu p-4 gap-1">
            <li class="menu-title">
              <span>Principal</span>
            </li>
            <li>
              <.link navigate={~p"/admin/home"} class="gap-3">
                <.icon name="hero-home" class="size-5" /> Dashboard
              </.link>
            </li>
            <li>
              <.link navigate={~p"/admin/analytics"} class="gap-3">
                <.icon name="hero-chart-bar" class="size-5" /> Analytics
              </.link>
            </li>

            <li class="menu-title mt-4">
              <span>Gerenciamento</span>
            </li>
            <li>
              <.link navigate={~p"/admin/empresas"} class="gap-3">
                <.icon name="hero-building-office" class="size-5" /> Empresas
              </.link>
            </li>
            <li>
              <.link navigate={~p"/admin/vagas"} class="gap-3">
                <.icon name="hero-briefcase" class="size-5" /> Vagas
              </.link>
            </li>
            <li>
              <.link navigate={~p"/admin/users"} class="gap-3">
                <.icon name="hero-users" class="size-5" /> Usuários
              </.link>
            </li>
            <li>
              <.link navigate={~p"/admin/forum"} class="gap-3">
                <.icon name="hero-chat-bubble-left-right" class="size-5" /> Fórum
              </.link>
            </li>

            <li class="menu-title mt-4">
              <span>Conteúdo</span>
            </li>
            <li>
              <.link navigate={~p"/admin/posts"} class="gap-3">
                <.icon name="hero-document-text" class="size-5" /> Posts
              </.link>
            </li>
            <li>
              <.link navigate={~p"/admin/media"} class="gap-3">
                <.icon name="hero-photo" class="size-5" /> Mídia
              </.link>
            </li>

            <li class="menu-title mt-4">
              <span>Sistema</span>
            </li>
            <li>
              <.link navigate={~p"/admin/settings"} class="gap-3">
                <.icon name="hero-cog-6-tooth" class="size-5" /> Configurações
              </.link>
            </li>
            <li>
              <.link navigate={~p"/admin/logs"} class="gap-3">
                <.icon name="hero-clipboard-document-list" class="size-5" /> Logs
              </.link>
            </li>
            <li>
              <.button
                :if={Vagas.can_create_vaga?(@current_user)}
                phx-click={JS.navigate(~p"/vagas/new")}
                class="btn btn-primary"
              >
                <.icon name="hero-plus" class="w-4 h-4 mr-2" /> Nova Vaga
              </.button>
            </li>
            <li>
              <.button
                :if={Vagas.can_create_vaga?(@current_user)}
                phx-click={JS.navigate(~p"/empresas/new")}
                class="btn btn-primary"
              >
                <.icon name="hero-plus" class="w-4 h-4 mr-2" /> Nova Empresa
              </.button>
            </li>
          </ul>
        </aside>
      </div>
    </div>
    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-1/3 h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=light]_&]:left-1/3 [[data-theme=dark]_&]:left-2/3 transition-[left]" />

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="light"
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="dark"
      >
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end
end
