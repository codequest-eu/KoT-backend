defmodule Kot.Player do
  use Kot.Web, :model

  schema "players" do
    field :name, :string
    field :wow_id, :integer

    many_to_many :game_sessions, Kot.GameSession,
                 join_through: Kot.PlayerGameSession

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :wow_id])
    |> validate_required([:name, :wow_id])
  end
end
