defmodule Kot.ZoneView do
  use Kot.Web, :view

  def render("zone.json", %{zone: zone}) do
    %{id: zone.id, name: zone.name}
  end
end
