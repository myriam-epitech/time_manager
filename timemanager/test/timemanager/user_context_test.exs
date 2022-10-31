# defmodule Timemanager.UserContextTest do
#   use Timemanager.DataCase

#   alias Timemanager.UserContext

#   describe "users" do
#     alias Timemanager.UserContext.User

#     import Timemanager.UserContextFixtures

#     @invalid_attrs %{email: nil, username: nil}

#     test "list_users/0 returns all users" do
#       user = user_fixture()
#       assert UserContext.list_users() == [user]
#     end

#     test "get_user!/1 returns the user with given id" do
#       user = user_fixture()
#       assert UserContext.get_user!(user.id) == user
#     end

#     test "create_user/1 with valid data creates a user" do
#       valid_attrs = %{email: "some email", username: "some username"}

#       assert {:ok, %User{} = user} = UserContext.create_user(valid_attrs)
#       assert user.email == "some email"
#       assert user.username == "some username"
#     end

#     test "create_user/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = UserContext.create_user(@invalid_attrs)
#     end

#     test "update_user/2 with valid data updates the user" do
#       user = user_fixture()
#       update_attrs = %{email: "some updated email", username: "some updated username"}

#       assert {:ok, %User{} = user} = UserContext.update_user(user, update_attrs)
#       assert user.email == "some updated email"
#       assert user.username == "some updated username"
#     end

#     test "update_user/2 with invalid data returns error changeset" do
#       user = user_fixture()
#       assert {:error, %Ecto.Changeset{}} = UserContext.update_user(user, @invalid_attrs)
#       assert user == UserContext.get_user!(user.id)
#     end

#     test "delete_user/1 deletes the user" do
#       user = user_fixture()
#       assert {:ok, %User{}} = UserContext.delete_user(user)
#       assert_raise Ecto.NoResultsError, fn -> UserContext.get_user!(user.id) end
#     end

#     test "change_user/1 returns a user changeset" do
#       user = user_fixture()
#       assert %Ecto.Changeset{} = UserContext.change_user(user)
#     end
#   end
# end
