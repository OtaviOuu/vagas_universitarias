defmodule VagasUniversitariasWeb.PageController do
  use VagasUniversitariasWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/vagas")
  end
end
