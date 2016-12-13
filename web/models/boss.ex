defmodule Kot.Boss do
  use Kot.Web, :model

  schema "bosses" do
    field :zone_id, :integer
    field :npc_wow_id, :integer

    belongs_to :zone, Kot.Zone
    has_many :boss_kills, Kot.BossKill

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
