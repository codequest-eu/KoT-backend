defmodule Kot.Repo.Migrations.AddCompleteTimeAndInstanceIdToGameSessionsTable do
  use Ecto.Migration

  def change do
    alter table(:game_sessions) do
      add :instance_id, :integer
      add :complete_time, :datetime
    end
  end
end
