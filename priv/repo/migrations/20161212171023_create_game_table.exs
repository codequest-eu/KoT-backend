defmodule Kot.Repo.Migrations.CreateGameTable do
  use Ecto.Migration

  def change do
    create table(:game_tables) do
      add :zone_id, :integer
      add :server_wow_id, :integer

      timestamps()
    end

  end
end
