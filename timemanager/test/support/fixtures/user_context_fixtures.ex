defmodule Timemanager.UserContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.UserContext` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    role = %{role: Timemanager.RoleContextFixtures.role_fixture()}
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "fixture@email.fr",
        username: "fixtureusername",
        password: "password",
        password_confirmation: "password",
        role_id: role.role.id
      })
      |> Timemanager.UserContext.create_user()

    user
  end
end
