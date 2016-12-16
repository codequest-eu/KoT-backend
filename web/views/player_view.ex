defmodule Kot.PlayerView do
  use Kot.Web, :view

  def render("player.json", %{player: player, pair_code: pair_code}) do
    %{id: player.id, name: player.name, pair_code: pair_code}
  end
end
