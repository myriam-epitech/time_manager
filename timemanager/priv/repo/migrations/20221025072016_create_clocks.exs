defmodule Timemanager.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :naive_datetime, null: false
      add :status, :boolean, default: false, null: false

      timestamps()
    end

    alter table(:clocks) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
    end

    # create index(:clocks, [:user])

  end
end
