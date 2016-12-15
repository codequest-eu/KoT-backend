defmodule Kot.GameSessionView do
  use Kot.Web, :view

  def render("game_session_create.json", %{game_table: game_table, zone: zone, bosses: bosses, game_session: game_session, players: players}) do
    %{
      game_table: render_one(game_table, Kot.GameTableView, "game_table.json"),
      game_session: %{
        id: game_session.id,
        name: "Team 1",
        players: render_many(players, Kot.PlayerView, "player.json")
      },
      zone: render_one(zone, Kot.ZoneView, "zone.json"),
      bosses: render_many(bosses, Kot.BossView, "boss.json")
    }
  end

  def render("pair.json", %{zone_wow_id: zone_wow_id, boss_wow_ids: boss_wow_ids}) do
    %{zone_wow_id: zone_wow_id, boss_wow_ids: boss_wow_ids}
  end
end
