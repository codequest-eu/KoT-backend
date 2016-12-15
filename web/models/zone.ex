defmodule Kot.Zone do
  use Kot.Web, :model

  schema "zones" do
    field :wow_id, :integer
    field :name, :string, null: false

    has_many :game_tables, Kot.GameTable
    has_many :bosses, Kot.Boss

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:wow_id, :name])
    |> validate_required([:wow_id, :name])
  end
end
