defmodule Kot.Repo.Migrations.AddPairCodeToPlayerGameSessionsTable do
  use Ecto.Migration

  def change do
    alter table(:player_game_sessions) do
      add :pair_code, :string
    end
  end
end
