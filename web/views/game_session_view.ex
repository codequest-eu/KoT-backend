defmodule Kot.GameSessionView do
  use Kot.Web, :view

  def render("game_session_create.json", %{game_table: game_table, zone: zone, bosses: bosses, game_session: game_session, players: players, pair_code: pair_code}) do
    %{
      game_table: render_one(game_table, Kot.GameTableView, "game_table.json"),
      game_session: %{
        id: game_session.id,
        name: "Team 1",
        # players: render_many(players, Kot.PlayerView, "player.json", pair_code: pair_code)
        players: Enum.map(players, fn(player) ->
          render(Kot.PlayerView, "player.json", player: player, pair_code: pair_code)
        end)
      },
      zone: render_one(zone, Kot.ZoneView, "zone.json"),
      bosses: render_many(bosses, Kot.BossView, "boss.json"),
    }
  end

  def render("pair.json", %{boss_wow_ids: boss_wow_ids, instance_id: instance_id, first_npc_wow_ids: first_npc_wow_ids}) do
    %{
      boss_wow_ids: boss_wow_ids,
      instance_id: instance_id,
      first_npc_wow_ids: first_npc_wow_ids
    }
  end
end
