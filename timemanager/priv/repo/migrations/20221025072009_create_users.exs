defmodule Timemanager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false

      timestamps()
    end

    alter table(:users) do
      add :role_id, references(:roles, on_delete: :delete_all),  default: 1
    end

    # create index(:users, [:role])
  end
end
