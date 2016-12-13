defmodule Kot.Repo.Migrations.AddGameSessionIdToCombatLogsTable do
  use Ecto.Migration

  def change do

    alter table(:combat_logs) do
      add :game_session_id, references(:game_sessions)
    end
  end
end
