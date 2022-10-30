defmodule Timemanager.RoleContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.RoleContext` context.
  """

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        name: "EMPLOYEE"
      })
      |> Timemanager.RoleContext.create_role()

    role
  end
end
