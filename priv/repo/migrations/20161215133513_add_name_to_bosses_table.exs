defmodule Kot.Repo.Migrations.AddNameToBossesTable do
  use Ecto.Migration

  def change do
    alter table(:bosses) do
      add :name, :string, null: false
    end
  end
end
