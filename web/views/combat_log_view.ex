defmodule Kot.CombatLogView do
  use Kot.Web, :view

  def render("zone_status.json", %{all_bosses_killed: all_bosses_killed}) do
    %{all_bosses_killed: all_bosses_killed}
  end

end
