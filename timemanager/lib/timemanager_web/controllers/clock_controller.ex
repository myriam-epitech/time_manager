defmodule TimemanagerWeb.ClockController do
  use TimemanagerWeb, :controller

  alias Timemanager.ClockContext
  alias Timemanager.ClockContext.Clock

  action_fallback TimemanagerWeb.FallbackController

  def getByUserID(conn, %{"userID" => userID}) do
    # {user_id, ""}  = Integer.parse(userID)

    clock = ClockContext.getByUserID!(userID)
    render(conn, "index.json", clocks: clock)
  end

  def create(conn, %{"clock" => clock_params, "userID" => userID}) do
    {user_id, ""}  = Integer.parse(userID)

    with {:ok, %Clock{} = clock} <- ClockContext.create_clock(clock_params, user_id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :create, clock))
      |> render("show.json", clock: clock)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   clock = ClockContext.get_clock!(id)
  #   render(conn, "show.json", clock: clock)
  # end

  # def update(conn, %{"id" => id, "clock" => clock_params}) do
  #   clock = ClockContext.get_clock!(id)

  #   with {:ok, %Clock{} = clock} <- ClockContext.update_clock(clock, clock_params) do
  #     render(conn, "show.json", clock: clock)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   clock = ClockContext.get_clock!(id)

  #   with {:ok, %Clock{}} <- ClockContext.delete_clock(clock) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
