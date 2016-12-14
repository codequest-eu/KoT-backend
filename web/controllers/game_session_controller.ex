defmodule Kot.GameSessionController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.PlayerGameSession
  alias Kot.GameSession

  def pair(conn, params) do
    player_game_session = Repo.get_by(PlayerGameSession, pair_code: params["pair_code"])
      |> Repo.preload([game_session: [game_table: [zone: [:bosses]]]])
    zone = player_game_session.game_session.game_table.zone
    boss_ids = Enum.map(zone.bosses, fn(boss) -> boss.id end)

    pgs_changeset = PlayerGameSession.changeset(player_game_session, %{paired: true})
    Repo.update! pgs_changeset

    render(conn, "pair.json", zone_id: zone.id, boss_ids: boss_ids)
  end

  def start(conn, params) do
    player_game_session = Repo.get_by(PlayerGameSession, pair_code: params["pair_code"])
      |> Repo.preload([:game_session])
    start_time = params["start_time"] |> Timex.parse!("%m/%d %H:%M:%S.%f", :strftime) |> Ecto.DateTime.cast!
    gs_changeset = GameSession.changeset(player_game_session, %{start_time: start_time, instance_id: params["instance_id"]})
    Repo.update! gs_changeset

    text(conn, "ok")
  end
end
