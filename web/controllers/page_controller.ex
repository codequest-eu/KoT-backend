defmodule Kot.PageController do
  use Kot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
