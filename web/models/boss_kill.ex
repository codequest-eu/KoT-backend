defmodule Kot.BossKill do
  use Kot.Web, :model

  schema "boss_kills" do
    field :game_session_id, :integer
    field :boss_id, :integer
    field :kill_time, Ecto.DateTime

    belongs_to :game_session, Kot.GameSession
    belongs_to :boss, Kot.Boss

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:game_session_id, :boss_id, :kill_time])
    |> validate_required([:game_session_id, :boss_id, :kill_time])
  end
end
