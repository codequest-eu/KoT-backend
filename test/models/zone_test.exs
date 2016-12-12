defmodule KoTModule.ZoneTest do
  use KoTModule.ModelCase

  alias KoTModule.Zone

  @valid_attrs %{wow_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Zone.changeset(%Zone{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Zone.changeset(%Zone{}, @invalid_attrs)
    refute changeset.valid?
  end
end
