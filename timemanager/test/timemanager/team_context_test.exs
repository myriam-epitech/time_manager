# defmodule Timemanager.TeamContextTest do
#   use Timemanager.DataCase

#   alias Timemanager.TeamContext

#   describe "teams" do
#     alias Timemanager.TeamContext.Team

#     import Timemanager.TeamContextFixtures

#     @invalid_attrs %{name: nil}

#     test "list_teams/0 returns all teams" do
#       team = team_fixture()
#       assert TeamContext.list_teams() == [team]
#     end

#     test "get_team!/1 returns the team with given id" do
#       team = team_fixture()
#       assert TeamContext.get_team!(team.id) == team
#     end

#     test "create_team/1 with valid data creates a team" do
#       valid_attrs = %{name: "some name"}

#       assert {:ok, %Team{} = team} = TeamContext.create_team(valid_attrs)
#       assert team.name == "some name"
#     end

#     test "create_team/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = TeamContext.create_team(@invalid_attrs)
#     end

#     test "update_team/2 with valid data updates the team" do
#       team = team_fixture()
#       update_attrs = %{name: "some updated name"}

#       assert {:ok, %Team{} = team} = TeamContext.update_team(team, update_attrs)
#       assert team.name == "some updated name"
#     end

#     test "update_team/2 with invalid data returns error changeset" do
#       team = team_fixture()
#       assert {:error, %Ecto.Changeset{}} = TeamContext.update_team(team, @invalid_attrs)
#       assert team == TeamContext.get_team!(team.id)
#     end

#     test "delete_team/1 deletes the team" do
#       team = team_fixture()
#       assert {:ok, %Team{}} = TeamContext.delete_team(team)
#       assert_raise Ecto.NoResultsError, fn -> TeamContext.get_team!(team.id) end
#     end

#     test "change_team/1 returns a team changeset" do
#       team = team_fixture()
#       assert %Ecto.Changeset{} = TeamContext.change_team(team)
#     end
#   end
# end
