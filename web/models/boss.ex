defmodule Kot.Boss do
  use Kot.Web, :model

  schema "bosses" do
    field :wow_id, :integer
    field :name, :string

    belongs_to :zone, Kot.Zone
    has_many :boss_kills, Kot.BossKill

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:zone_id, :wow_id, :name])
    |> validate_required([:zone_id, :name])
  end
end
