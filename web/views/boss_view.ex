defmodule Kot.BossView do
  use Kot.Web, :view

  def render("boss.json", %{boss: boss}) do
    %{id: boss.id, name: boss.name}
  end
end
