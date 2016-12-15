defmodule Kot.PlayerGameSession do
  use Kot.Web, :model

  schema "player_game_sessions" do
    field :pair_code, :string
    field :status, :string, default: false

    belongs_to :player, Kot.Player
    belongs_to :game_session, Kot.GameSession

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pair_code, :status, :game_session_id])
  end
end
