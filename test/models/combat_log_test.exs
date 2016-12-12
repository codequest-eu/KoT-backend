defmodule KoTModule.CombatLogTest do
  use KoTModule.ModelCase

  alias KoTModule.CombatLog

  @valid_attrs %{damage: 42, event: "some content", event_timestamp: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, instance_wow_id: 42, npc_wow_id: 42, player_wow_id: 42, server_wow_id: 42, zone_wow_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CombatLog.changeset(%CombatLog{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CombatLog.changeset(%CombatLog{}, @invalid_attrs)
    refute changeset.valid?
  end
end
