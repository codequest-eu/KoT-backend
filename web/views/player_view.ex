defmodule Kot.PlayerView do
  use Kot.Web, :view

  def render("player.json", %{player: player}) do
    %{id: player.id, name: player.name}
  end
end
