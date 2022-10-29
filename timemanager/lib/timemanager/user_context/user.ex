defmodule Timemanager.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string

    has_many :workingtimes, Timemanager.WTContext.WT
    has_one :clocks, Timemanager.ClockContext.Clock
    belongs_to :role, Timemanager.RoleContext.Role
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :role_id])
    |> validate_format(:email, ~r/^[\w]+[\.\-]*[\w]+@([\w-]+\.)+[\w-]{2,4}$/)
    |> validate_required([:username, :email, :role_id])
    |> assoc_constraint(:role)
  end
end
