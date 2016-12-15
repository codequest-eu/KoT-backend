defmodule Kot.PlayerGameSessionView do
  use Kot.Web, :view

  def render("status.json", %{status: status}) do
    %{ status: status }
  end
end
