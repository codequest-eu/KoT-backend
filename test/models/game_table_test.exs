defmodule Kot.GameTableTest do
  use Kot.ModelCase

  alias Kot.GameTable

  @valid_attrs %{server_wow_id: 42, zone_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GameTable.changeset(%GameTable{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GameTable.changeset(%GameTable{}, @invalid_attrs)
    refute changeset.valid?
  end
end
