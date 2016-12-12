defmodule KoTModule.Repo.Migrations.CreateZone do
  use Ecto.Migration

  def change do
    create table(:zones) do
      add :wow_id, :integer

      timestamps()
    end

  end
end
