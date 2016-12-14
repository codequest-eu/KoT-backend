defmodule Kot.Repo.Migrations.AddBossCountToGameSessionsTable do
  use Ecto.Migration

  def change do
    alter table(:game_sessions) do
      add :boss_count, :integer
    end
  end
end
