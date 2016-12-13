defmodule Kot.Repo.Migrations.RemovePairCodeFromGameSessionsTable do
  use Ecto.Migration

  def up do
    alter table(:game_sessions) do
      remove(:pair_code)
    end
  end

  def down do
    alter table(:game_sessions) do
      add :pair_code, :string
    end
  end
end
