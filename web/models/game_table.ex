defmodule KoTModule.GameTable do
  use KoTModule.Web, :model

  schema "game_tables" do
    field :zone_id, :integer
    field :server_wow_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:zone_id, :server_wow_id])
    |> validate_required([:zone_id, :server_wow_id])
  end
end
