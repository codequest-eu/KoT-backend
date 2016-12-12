defmodule KoTModule.Boss do
  use KoTModule.Web, :model

  schema "bosses" do
    field :zone_id, :integer
    field :npc_wow_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:zone_id, :npc_wow_id])
    |> validate_required([:zone_id, :npc_wow_id])
  end
end
