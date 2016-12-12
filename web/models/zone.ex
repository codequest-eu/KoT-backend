defmodule KoTModule.Zone do
  use KoTModule.Web, :model

  schema "zones" do
    field :wow_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:wow_id])
    |> validate_required([:wow_id])
  end
end
