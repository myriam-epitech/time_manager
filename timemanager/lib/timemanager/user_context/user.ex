defmodule Timemanager.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string

    has_many :workingtimes, Timemanager.WTContext.WT
    has_many :clocks, Timemanager.ClockContext.Clock
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
end
