defmodule Kot.BossKillTest do
  use Kot.ModelCase

  alias Kot.BossKill

  @valid_attrs %{boss_id: 42, game_session_id: 42, kill_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BossKill.changeset(%BossKill{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BossKill.changeset(%BossKill{}, @invalid_attrs)
    refute changeset.valid?
  end
end
