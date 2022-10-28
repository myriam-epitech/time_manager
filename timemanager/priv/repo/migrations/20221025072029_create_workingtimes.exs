defmodule Timemanager.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :naive_datetime, null: false
      add :end, :naive_datetime, null: false

      timestamps()
    end

    alter table(:workingtimes) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
    end
  end
end
