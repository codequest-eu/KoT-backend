defmodule Kot.Repo.Migrations.RemovePairedFromPlayerGameSessionsTable do
  use Ecto.Migration

  def up do
    alter table(:player_game_sessions) do
      remove(:paired)
    end
  end

  def down do
    alter table(:player_game_sessions) do
      add :paired, :boolean, default: false, null: false
    end
  end
end
