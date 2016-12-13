defmodule Kot.GameSession do
  use Kot.Web, :model

  schema "game_sessions" do
    field :start_time, Ecto.DateTime
    field :pair_code, :string

    belongs_to :game_table, Kot.GameTable
    has_many :combat_logs, Kot.CombatLog
    has_many :boss_kills, Kot.BossKill
    many_to_many :players, Kot.Player,
                 join_through: "player_game_sessions"


    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_time, :pair_code])
    |> validate_required([:start_time, :pair_code])
  end
end
