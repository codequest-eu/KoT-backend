defmodule Kot.Repo.Migrations.CreatePlayerGameSessionsTable do
  use Ecto.Migration

  def change do
    create table(:player_game_sessions) do
      add :player_id, references(:players)
      add :game_session_id, references(:game_sessions)

      timestamps
    end
  end
end
