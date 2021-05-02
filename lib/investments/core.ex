defmodule Investments.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias Investments.Repo

  alias Investments.Core.Instrument

  @doc """
  Returns the list of instruments.

  ## Examples

      iex> list_instruments()
      [%Instrument{}, ...]

  """
  def list_instruments do
    Repo.all(Instrument)
  end

  @doc """
  Gets a single instrument.

  Raises `Ecto.NoResultsError` if the Instrument does not exist.

  ## Examples

      iex> get_instrument!(123)
      %Instrument{}

      iex> get_instrument!(456)
      ** (Ecto.NoResultsError)

  """
  def get_instrument!(id), do: Repo.get!(Instrument, id)

  @doc """
  Creates a instrument.

  ## Examples

      iex> create_instrument(%{field: value})
      {:ok, %Instrument{}}

      iex> create_instrument(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_instrument(attrs \\ %{}) do
    %Instrument{}
    |> Instrument.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a instrument.

  ## Examples

      iex> update_instrument(instrument, %{field: new_value})
      {:ok, %Instrument{}}

      iex> update_instrument(instrument, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_instrument(%Instrument{} = instrument, attrs) do
    instrument
    |> Instrument.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a instrument.

  ## Examples

      iex> delete_instrument(instrument)
      {:ok, %Instrument{}}

      iex> delete_instrument(instrument)
      {:error, %Ecto.Changeset{}}

  """
  def delete_instrument(%Instrument{} = instrument) do
    Repo.delete(instrument)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking instrument changes.

  ## Examples

      iex> change_instrument(instrument)
      %Ecto.Changeset{data: %Instrument{}}

  """
  def change_instrument(%Instrument{} = instrument, attrs \\ %{}) do
    Instrument.changeset(instrument, attrs)
  end
end
