defmodule TimemanagerWeb.TeamController do
  use TimemanagerWeb, :controller

  alias Timemanager.TeamContext
  alias Timemanager.TeamContext.Team

  action_fallback TimemanagerWeb.FallbackController

  def index(conn, _params) do
    teams = TeamContext.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- TeamContext.create_team(team_params) do
      render(conn, "show.json", team: team)
      # conn
      # |> put_status(:created)
      # |> put_resp_header("location", Routes.team_path(conn, :show, team))
      # |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = TeamContext.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = TeamContext.get_team!(id)

    with {:ok, %Team{} = team} <- TeamContext.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = TeamContext.get_team!(id)

    with {:ok, %Team{}} <- TeamContext.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end
