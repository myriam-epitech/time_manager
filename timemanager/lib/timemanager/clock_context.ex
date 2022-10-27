defmodule Timemanager.ClockContext do
  @moduledoc """
  The ClockContext context.
  """

  import Ecto.Query, warn: false
  alias Timemanager.Repo

  alias Timemanager.ClockContext.Clock

  @doc """
  Returns the list of clocks.

  ## Examples

      iex> list_clocks()
      [%Clock{}, ...]

  """
  def list_clocks do
    Repo.all(Clock)
  end

  def getByUserID!(user_id) do
    query = from(p in Clock, where: p.user_id == ^user_id)
    Repo.all(query) |> Repo.preload([:user])
  end

  @doc """
  Gets a single clock.

  Raises `Ecto.NoResultsError` if the Clock does not exist.

  ## Examples

      iex> get_clock!(123)
      %Clock{}

      iex> get_clock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clock!(id), do: Repo.get!(Clock, id)

  @doc """
  Creates a clock.

  ## Examples

      iex> create_clock(%{field: value})
      {:ok, %Clock{}}

      iex> create_clock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clock(attrs \\ %{}, user_id) do
    query = from p in Clock, where: p.user_id == ^user_id
    if Repo.exists?(query) do
      clock = Repo.get_by!(Clock, [user_id: user_id])
      update_clock(clock, attrs)
    else
      %Clock{user_id: user_id}
      |> Repo.preload([:user])
      |> Clock.changeset(attrs)
      |> Repo.insert()
    end
  end

  @doc """
  Updates a clock.

  ## Examples

  iex> update_clock(clock, %{field: new_value})
  {:ok, %Clock{}}

  iex> update_clock(clock, %{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Repo.preload([:user])
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clock.

  ## Examples

      iex> delete_clock(clock)
      {:ok, %Clock{}}

      iex> delete_clock(clock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clock changes.

  ## Examples

      iex> change_clock(clock)
      %Ecto.Changeset{data: %Clock{}}

  """
  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end
end
