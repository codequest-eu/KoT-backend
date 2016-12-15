defmodule Kot.PlayerGameSessionController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.PlayerGameSession

  def status(conn, params) do
    player_game_session = Repo.get(PlayerGameSession, params["id"])
    IO.inspect player_game_session
    render(conn, "status.json", status: player_game_session.status)
  end
end
