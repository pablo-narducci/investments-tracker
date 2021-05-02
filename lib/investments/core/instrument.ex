defmodule Investments.Core.Instrument do
  use Ecto.Schema
  import Ecto.Changeset

  schema "instruments" do
    field :code, :string
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(instrument, attrs) do
    instrument
    |> cast(attrs, [:code, :name, :description])
    |> validate_required([:code, :name, :description])
  end
end
