defmodule Kot.GameTable do
  use Kot.Web, :model

  schema "game_tables" do
    field :server_wow_id, :integer

    belongs_to :zone, Kot.Zone
    has_many :game_sessions, Kot.GameSession

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:zone_id, :server_wow_id])
    |> validate_required([:zone_id])
  end
end
