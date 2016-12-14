defmodule Kot.CombatLogValidator do
  alias Kot.Repo
  alias Kot.CombatLog

  def is_unique(combat_log_data) do
    event_timestamp = combat_log_data["event_timestamp"]
    player_wow_id = combat_log_data["player_wow_id"]

    !Repo.get_by(CombatLog, event_timestamp: event_timestamp, player_wow_id: player_wow_id)
  end
end
