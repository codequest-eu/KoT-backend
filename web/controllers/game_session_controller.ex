defmodule Kot.GameSessionController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.PlayerGameSession
  alias Kot.GameSession


  import Kot.Fetchers
  import Kot.DateParser

  def pair(conn, params) do
    player_game_session =
      fetch_pgs(params["pair_code"], [game_session: [game_table: [zone: [:bosses]]]])

    zone = player_game_session.game_session.game_table.zone
    boss_ids = Enum.map(zone.bosses, fn(boss) -> boss.id end)

    pgs_changeset = PlayerGameSession.changeset(player_game_session, %{paired: true})
    Repo.update! pgs_changeset

    render(conn, "pair.json", zone_id: zone.id, boss_ids: boss_ids)
  end

  def start(conn, params) do
    {:ok, game_session } =
      fetch_pgs(params["pair_code"], [:game_session])
      |> Map.fetch(:game_session)

    start_time = params["start_time"] |> to_ecto_datetime

    gs_changeset = GameSession.changeset(game_session, %{start_time: start_time, instance_id: params["instance_id"]})
    Repo.update! gs_changeset

    text(conn, "ok")
  end
end
