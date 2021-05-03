defmodule Investments.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :unit_buy_price, :float
      add :unit_sell_price, :float
      add :date_open, :naive_datetime
      add :date_close, :naive_datetime
      add :instrument_id, references(:instruments, on_delete: :nothing)

      timestamps()
    end

    create index(:transactions, [:instrument_id])
  end
end
