defmodule Kot.Repo.Migrations.AddRenameNpcWowIdToWowIdInBossesTable do
  use Ecto.Migration

  def change do
    rename table(:bosses), :npc_wow_id, to: :wow_id
  end
end
