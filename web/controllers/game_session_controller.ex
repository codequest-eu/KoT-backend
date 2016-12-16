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
  alias Kot.Zone
  alias Kot.Player

  def create(conn, params) do
    player = Repo.get_by(Player, name: params["user_name"])
    zone = Repo.get(Zone, params["zone_id"])
    bosses = Repo.all(Boss, zone_id: zone.id)
    game_table_changeset = GameTable.changeset(%GameTable{}, %{zone_id: zone.id})
    game_table = Repo.insert!(game_table_changeset)
    game_session_changeset = GameSession.changeset(%GameSession{}, %{game_table_id: game_table.id, boss_count: bosses |> Enum.count})
    game_session = Repo.insert!(game_session_changeset)
    player_game_session_changeset = PlayerGameSession.changeset(%PlayerGameSession{},
      %{pair_code: SecureRandom.urlsafe_base64, status: "unpaired", game_session_id: game_session.id, player_id: player.id})
    pgs = Repo.insert!(player_game_session_changeset)

    render(conn, "game_session_create.json", game_table: game_table, zone: zone,
     bosses: bosses, game_session: game_session, players: [player], pair_code: pgs.pair_code)
  end

  def pair(conn, params) do
    player_game_session =
      Fetchers.fetch_pgs(params["pair_code"], [game_session: [game_table: [zone: [:bosses]]]])

    bosses = player_game_session.game_session.game_table.zone.bosses
    boss_wow_ids = Enum.map(bosses, fn(boss) -> boss.wow_id end)

    pgs_changeset = PlayerGameSession.changeset(player_game_session, %{status: "paired"})
    Repo.update! pgs_changeset

    render(conn, "pair.json", boss_wow_ids: boss_wow_ids,
      first_npc_wow_ids: player_game_session.game_session.first_npc_wow_ids,
      instance_id: player_game_session.game_session.instance_id)
  end

  def start(conn, params) do
    player_game_session = Fetchers.fetch_pgs(params["pair_code"], [:game_session])
    pgs_changeset = PlayerGameSession.changeset(player_game_session, %{status: "started"})
    Repo.update! pgs_changeset

    start_time = params["start_time"] |> DateParser.to_ecto_datetime
    gs_changeset = GameSession.changeset(player_game_session.game_session, %{start_time: start_time, instance_id: params["instance_id"]})
    Repo.update! gs_changeset

    text(conn, "ok")
  end
end
