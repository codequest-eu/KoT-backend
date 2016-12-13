defmodule Kot.Repo.Migrations.AddPairedToPlayerGameSessions do
  use Ecto.Migration

  def change do
    alter table(:player_game_sessions) do
      add :paired, :boolean, default: false, null: false
    end
  end
end
