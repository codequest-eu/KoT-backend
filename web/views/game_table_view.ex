defmodule Kot.GameTableView do
  use Kot.Web, :view

  def render("game_table.json", %{game_table: game_table}) do
    %{id: game_table.id}
  end
end
