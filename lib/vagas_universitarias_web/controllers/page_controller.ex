defmodule VagasUniversitariasWeb.PageController do
  use VagasUniversitariasWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
