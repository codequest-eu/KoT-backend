defmodule Kot.Repo.Migrations.AddNameToZonesTable do
  use Ecto.Migration

  def change do
    alter table(:zones) do
      add :name, :string, null: false
    end
  end
end
