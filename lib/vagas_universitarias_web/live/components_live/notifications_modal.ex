defmodule VagasUniversitariasWeb.ComponentsLive.NotificationsModal do
  use VagasUniversitariasWeb, :live_component

  alias VagasUniversitarias.Social

  def mount(assigns, socket) do
    socket =
      socket
      |> assign(assigns)

    {:ok, socket}
  end

  def update(assigns, socket) do
    notifications = Ash.load!(assigns.current_user.user_profile, :notifications)
    assigns = Map.put(assigns, :notifications, notifications.notifications)
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <div class="dropdown dropdown-end">
      <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
        <div class="indicator">
          <.icon name="hero-bell" class="size-5" />
          <span class="badge badge-xs badge-primary indicator-item">{length(@notifications)}</span>
        </div>
      </div>

      <ul
        tabindex="0"
        class="dropdown-content menu bg-base-100 rounded-box shadow w-72 mt-3 p-2"
      >
        <li :for={notification <- @notifications} class="border-b border-base-200 mb-2 pb-2">
          <div class="p-2">
            <p class="font-semibold">{notification.message}</p>
            <p class="text-sm text-gray-500">25Pay</p>
          </div>
        </li>
      </ul>
    </div>
    """
  end
end
