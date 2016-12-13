defmodule Kot.GameSessionView do
  use Kot.Web, :view

  def render("index.json", %{game_sessions: game_sessions}) do
    %{data: render_many(game_sessions, Kot.GameSessionView, "game_session.json")}
  end

  def render("game_session.json", %{game_session: game_session}) do
    %{title: game_session.title}
  end

  def render("pair.json", %{zone_id: zone_id, boss_ids: boss_ids}) do
    %{zone_id: zone_id, boss_ids: boss_ids}
  end
end
