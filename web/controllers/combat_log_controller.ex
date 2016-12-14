defmodule Kot.CombatLogController do
  use Kot.Web, :controller

  alias Kot.Repo
  alias Kot.CombatLog
  alias Kot.DateParser
  alias Kot.CombatLogValidator
  alias Kot.BossKill

  import Kot.Fetchers

  def create(conn, params) do
    all_bosses_killed = false
    game_session = fetch_pgs(params["pair_code"], [:game_session]).game_session
    time = params["combat_log"]["event_timestamp"] |> DateParser.to_ecto_datetime
    combat_log_data =
      params["combat_log"]
      |> Map.merge(%{"event_timestamp" => time, "game_session_id" => game_session.id})

    if CombatLogValidator.is_unique(combat_log_data) do
      combat_log_changeset = CombatLog.changeset(%CombatLog{}, combat_log_data)
      # combat_log = Repo.insert!(combat_log_changeset)
      combat_log = Repo.get(CombatLog, 5)

      if combat_log.event == "UNIT_DIED" do
        boss_kill_changeset = BossKill.changeset(%BossKill{}, %{game_session_id: game_session.id, boss_id: combat_log.npc_wow_id, kill_time: combat_log.event_timestamp} )
        boss_kill = Repo.insert!(boss_kill_changeset)


      end
    end
    render(conn, "zone_status.json", all_bosses_killed: all_bosses_killed)
  end
end
