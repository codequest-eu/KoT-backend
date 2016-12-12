defmodule Kot.Repo.Migrations.CreateBoss do
  use Ecto.Migration

  def change do
    create table(:bosses) do
      add :zone_id, :integer
      add :npc_wow_id, :integer

      timestamps()
    end

  end
end
