defmodule Kot.CombatLog do
  use Kot.Web, :model

  schema "combat_logs" do
    field :event_timestamp, Ecto.DateTime
    field :server_wow_id, :integer
    field :instance_wow_id, :integer
    field :zone_wow_id, :integer
    field :npc_wow_id, :integer
    field :event, :string
    field :player_wow_id, :integer
    field :damage, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:event_timestamp, :server_wow_id, :instance_wow_id, :zone_wow_id, :npc_wow_id, :event, :player_wow_id, :damage])
    |> validate_required([:event_timestamp, :server_wow_id, :instance_wow_id, :zone_wow_id, :npc_wow_id, :event, :player_wow_id, :damage])
  end
end
