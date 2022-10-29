defmodule Timemanager.Repo.Migrations.CreateUsersTeams do
  use Ecto.Migration

  def change do
    create table(:users_teams) do
      add :user_id, references(:users)
      add :team_id, references(:teams)
    end

    create unique_index(:users_teams, [:team_id, :user_id])
  end
end
