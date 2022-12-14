defmodule Timemanager.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string

    has_many :workingtimes, Timemanager.WTContext.WT
    has_one :clocks, Timemanager.ClockContext.Clock
    belongs_to :role, Timemanager.RoleContext.Role
    many_to_many :teams, Timemanager.TeamContext.Team, join_through: "users_teams"
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :role_id, :password, :password_confirmation])
    |> validate_format(:email, ~r/^[\w]+[\.\-]*[\w]+@([\w-]+\.)+[\w-]{2,4}$/)
    |> validate_required([:username, :email, :role_id, :password, :password_confirmation])
    |> assoc_constraint(:role)
    |> validate_confirmation(:password)
    |> hash_password
  end

  # def hash_password(changeset) do
  #   hash =  Bcrypt.hash_pwd_salt(get_field(changeset, :password))
  #   put_change(changeset, :password_hash, hash)
  # end
  def hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pwd}}
        -> put_change(changeset, :password_hash,  Bcrypt.hash_pwd_salt(pwd))
      _ -> changeset
    end
  end
end
