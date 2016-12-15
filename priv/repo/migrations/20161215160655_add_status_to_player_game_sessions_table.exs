defmodule Kot.Repo.Migrations.AddStatusToPlayerGameSessionsTable do
  use Ecto.Migration

  def change do
    alter table(:player_game_sessions) do
      add :status, :string, null: false
    end
  end
end
