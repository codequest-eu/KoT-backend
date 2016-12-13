defmodule Kot.GameSessionController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.PlayerGameSession

  def index(conn, _params) do
    game_sessions = [%{title: "foo"}, %{title: "bar"}]

    render(conn, "index.json", game_sessions: game_sessions)
  end


  def pair(conn, params) do
    player_game_session = Repo.get_by(PlayerGameSession, pair_code: params["pair_code"])
      |> Repo.preload([game_session: [game_table: [zone: [:bosses]]]])
    zone = player_game_session.game_session.game_table.zone
    boss_ids = Enum.map(zone.bosses, fn(boss) -> boss.id end)

    pgs_changeset = PlayerGameSession.changeset(player_game_session, %{paired: true})
    Repo.update! pgs_changeset

    render(conn, "pair.json", zone_id: zone.id, boss_ids: boss_ids)
  end

  # def create(conn, _params) do
  #   IEx.pry

    # changeset = Todo.changeset(%Todo{}, todo_params)

    # case Repo.insert(changeset) do

      # {:error, changeset} ->
      #   conn
      #   |> put_status(:unprocessable_entity)
      #   |> render(TodoApi.ChangesetView, "error.json", changeset: changeset)
    # end

    # {:ok, nil} ->
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", nil)
    #   |> render("show.json", game_session: 'a')
  # end
end
