defmodule VagasUniversitariasWeb.AdminLive.Home do
  use VagasUniversitariasWeb, :live_view


  on_mount {VagasUniversitariasWeb.LiveUserAuth, :live_admin_required}


  def render(assigns) do
    ~H"""
    <Layouts.admin_layout {assigns}>
      <h1>Admin Dashboard</h1>
    </Layouts.admin_layout>
    """
  end
end
