defmodule TimemanagerWeb.WTController do
  use TimemanagerWeb, :controller

  alias Timemanager.WTContext
  alias Timemanager.WTContext.WT

  action_fallback TimemanagerWeb.FallbackController

  def getAll(conn, %{"userID" => user_id, "start" => param_start, "end" => param_end}) do
    workingtimes = WTContext.getAllByUserIDAndParams!(user_id, param_start, param_end)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def getAll(conn, %{"userID" => user_id}) do#, "start" => param_start, "end" => param_end}) do
    workingtimes = WTContext.getAllByUserID!(user_id) #, param_start, param_end)
    #TODO gestion d'erreur
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def getOne(conn, %{"userID" => user_id, "id" => id}) do
    workingtime = WTContext.getOneByUserID!(user_id, id)
    render(conn, "show.json", wt: workingtime)
  end


  def create(conn, %{"wt" => wt_params, "userID" =>userID}) do
    {user_id, ""}  = Integer.parse(userID)

    with {:ok, %WT{} = wt} <- WTContext.create_wt(wt_params, user_id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.wt_path(conn, :create, wt))
      |> render("show.json", wt: wt)
    end
  end

  def update(conn, %{"id" => id, "wt" => wt_params}) do
    wt = WTContext.get_wt!(id)

    with {:ok, %WT{} = wt} <- WTContext.update_wt(wt, wt_params) do
      render(conn, "show.json", wt: wt)
    end
  end

  def delete(conn, %{"id" => id}) do
    wt = WTContext.get_wt!(id)

    with {:ok, %WT{}} <- WTContext.delete_wt(wt) do
      send_resp(conn, :no_content, "")
    end
  end
end
