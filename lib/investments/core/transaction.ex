defmodule Investments.Core.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :date_close, :naive_datetime
    field :date_open, :naive_datetime
    field :unit_buy_price, :float
    field :unit_sell_price, :float
    field :instrument_id, :id

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:unit_buy_price, :unit_sell_price, :date_open, :date_close])
    |> validate_required([:instrument_id, :unit_buy_price, :unit_sell_price, :date_open, :date_close])
  end
end
