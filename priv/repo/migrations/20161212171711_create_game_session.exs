defmodule KoTModule.Repo.Migrations.CreateGameSession do
  use Ecto.Migration

  def change do
    create table(:game_sessions) do
      add :start_time, :datetime
      add :pair_code, :string

      timestamps()
    end

  end
end
