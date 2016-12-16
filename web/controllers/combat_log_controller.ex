defmodule Kot.CombatLogController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.CombatLog
  alias Kot.DateParser
  alias Kot.CombatLogValidator
  alias Kot.BossKill
  alias Kot.GameSession

  import Kot.Fetchers

  def create(conn, params) do
    all_bosses_killed = false
    game_session = fetch_pgs(params["pair_code"], [:game_session]).game_session
    time = params["combat_log"]["event_timestamp"] |> DateParser.to_ecto_datetime
    combat_log_data =
      params["combat_log"]
      |> Map.merge(%{"event_timestamp" => time, "game_session_id" => game_session.id})

    if CombatLogValidator.is_unique(combat_log_data) do
      IO.inspect "********** CombatLog UNIQUE"
      combat_log_changeset = CombatLog.changeset(%CombatLog{}, combat_log_data)
      combat_log = Repo.insert!(combat_log_changeset)

      if combat_log.event == "UNIT_DIED" do
        IO.inspect "********** UNIT DIED"
        boss_kill_changeset = BossKill.changeset(%BossKill{}, %{game_session_id: game_session.id, boss_id: combat_log.npc_wow_id, kill_time: time} )
        Repo.insert!(boss_kill_changeset)

        boss_kill_count = Kot.Repo.all(Kot.BossKill, id: game_session.id) |> Enum.count

        if game_session.boss_count == boss_kill_count do
          IO.inspect "********** ALL BOSS KILL"
          game_session_changeset = GameSession.changeset(game_session, %{complete_time: time})
          Repo.update!(game_session_changeset)


          all_bosses_killed = true
        end
      end
      render(conn, "zone_status.json", all_bosses_killed: all_bosses_killed)
    else
      text(conn, "combat_log not unique: -> change wow_player_id, event_timestamp")
    end
  end
end
