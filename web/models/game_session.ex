defmodule Kot.GameSession do
  use Kot.Web, :model

  schema "game_sessions" do
    field :start_time, Ecto.DateTime

    belongs_to :game_table, Kot.GameTable
    has_many :combat_logs, Kot.CombatLog
    has_many :boss_kills, Kot.BossKill
    many_to_many :players, Kot.Player,
                 join_through: Kot.PlayerGameSession


    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_time])
    # |> validate_required([:start_time, :pair_code])
  end
end
