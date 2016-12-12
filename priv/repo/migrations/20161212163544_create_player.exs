defmodule Kot.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :wow_id, :integer

      timestamps()
    end

  end
end
