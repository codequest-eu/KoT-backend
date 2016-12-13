defmodule Kot.Repo.Migrations.AddGameTableReferenceToGameSessions do
  use Ecto.Migration

  def change do
    alter table(:game_sessions) do
      add :game_table_id, references(:game_tables)
    end
  end
end
