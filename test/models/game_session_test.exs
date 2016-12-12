defmodule Kot.GameSessionTest do
  use Kot.ModelCase

  alias Kot.GameSession

  @valid_attrs %{pair_code: "some content", start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GameSession.changeset(%GameSession{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GameSession.changeset(%GameSession{}, @invalid_attrs)
    refute changeset.valid?
  end
end
