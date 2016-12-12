defmodule KoTModule.PageController do
  use KoTModule.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
