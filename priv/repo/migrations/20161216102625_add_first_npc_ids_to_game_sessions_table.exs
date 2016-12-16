defmodule Kot.Repo.Migrations.AddFirstNpcIdsToGameSessionsTable do
  use Ecto.Migration

  def change do
    alter table(:game_sessions) do
      add :first_npc_wow_ids, {:array, :integer}
    end
  end
end
