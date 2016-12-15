defmodule Kot.GameSessionController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.PlayerGameSession
  alias Kot.GameSession
  alias Kot.GameTable
  alias Kot.Player
  alias Kot.Fetchers
  alias Kot.DateParser
  alias Kot.Boss

  def index(conn, params) do
    text(conn, "Hello Maniek. Wyslales mi: #{}")
  end

  def create(conn, params) do
    player = Repo.get_by(Player, name: params["user_name"])
    zone = Repo.get_by(Zone, params["zone_id"])
    game_table_changeset = GameTable.changeset(%GameTable{}, %{zone_id: zone.id})
    game_table = Repo.insert!(game_table_changeset)
    game_session_changeset = GameSession.changeset(%GameSession{}, %{game_table_id: game_table.id})
    game_session = Repo.insert!(game_session_changeset)
    bosses = Repo.all(Boss, zone_id: zone.id)




    text(conn, "ok")
  end

  def pair(conn, params) do
    player_game_session =
      Fetchers.fetch_pgs(params["pair_code"], [game_session: [game_table: [zone: [:bosses]]]])

    zone = player_game_session.game_session.game_table.zone
    boss_ids = Enum.map(zone.bosses, fn(boss) -> boss.id end)

    pgs_changeset = PlayerGameSession.changeset(player_game_session, %{paired: true})
    Repo.update! pgs_changeset

    render(conn, "pair.json", zone_id: zone.id, boss_ids: boss_ids)
  end

  def start(conn, params) do
    {:ok, game_session } =
      Fetchers.fetch_pgs(params["pair_code"], [:game_session])
      |> Map.fetch(:game_session)

    start_time = params["start_time"] |> Parser.to_ecto_datetime

    gs_changeset = GameSession.changeset(game_session, %{start_time: start_time, instance_id: params["instance_id"]})
    Repo.update! gs_changeset

    text(conn, "ok")
  end
end
