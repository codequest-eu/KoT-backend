defmodule Kot.Repo.Migrations.CreateCombatLog do
  use Ecto.Migration

  def change do
    create table(:combat_logs) do
      add :event_timestamp, :datetime
      add :server_wow_id, :integer
      add :instance_wow_id, :integer
      add :zone_wow_id, :integer
      add :npc_wow_id, :integer
      add :event, :string
      add :player_wow_id, :integer
      add :damage, :integer

      timestamps()
    end

  end
end
