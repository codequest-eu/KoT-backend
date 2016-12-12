defmodule KoTModule.BossTest do
  use KoTModule.ModelCase

  alias KoTModule.Boss

  @valid_attrs %{npc_wow_id: 42, zone_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Boss.changeset(%Boss{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Boss.changeset(%Boss{}, @invalid_attrs)
    refute changeset.valid?
  end
end
