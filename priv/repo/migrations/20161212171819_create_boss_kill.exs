defmodule KoTModule.Repo.Migrations.CreateBossKill do
  use Ecto.Migration

  def change do
    create table(:boss_kills) do
      add :game_session_id, :integer
      add :boss_id, :integer
      add :kill_time, :datetime

      timestamps()
    end

  end
end
