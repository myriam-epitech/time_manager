defmodule TimemanagerWeb.UserControllerTest do
  use TimemanagerWeb.ConnCase

  import Timemanager.UserContextFixtures
  import Timemanager.RoleContextFixtures

  alias Timemanager.UserContext.User

  @create_attrs %{
    email: "some@email.fr",
    username: "someusername",
    password: "password",
    password_confirmation: "password",
    role_id: 1
  }
  @update_attrs %{
    email: "updated@email.fr",
    username: "updatedusername",
    password: "updatedpassword",
    password_confirmation: "updatedpassword",
    role_id: 1
  }
  @invalid_attrs %{email: nil, username: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    setup [:create_role]

    test "renders user when data is valid", %{conn: conn, role: role} do
      user = Map.put(@create_attrs, :role_id, role.id)
      conn = post(conn, Routes.user_path(conn, :create), user: user)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "email" => "some@email.fr",
               "username" => "someusername"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_role]
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user, role: role} do
      updated_user = Map.put(@update_attrs, :role_id, role.id)
      conn = put(conn, Routes.user_path(conn, :update, user), user: updated_user)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "email" => "updated@email.fr",
               "username" => "updatedusername"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end

  defp create_role(_) do
    role = role_fixture()
    %{role: role}
  end

end
