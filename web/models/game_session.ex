defmodule Kot.GameSession do
  use Kot.Web, :model

  schema "game_sessions" do
    field :start_time, Ecto.DateTime
    field :pair_code, :string

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
