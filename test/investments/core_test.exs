defmodule Investments.CoreTest do
  use Investments.DataCase

  alias Investments.Core

  describe "instruments" do
    alias Investments.Core.Instrument

    @valid_attrs %{code: "some code", description: "some description", name: "some name"}
    @update_attrs %{code: "some updated code", description: "some updated description", name: "some updated name"}
    @invalid_attrs %{code: nil, description: nil, name: nil}

    def instrument_fixture(attrs \\ %{}) do
      {:ok, instrument} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_instrument()

      instrument
    end

    test "list_instruments/0 returns all instruments" do
      instrument = instrument_fixture()
      assert Core.list_instruments() == [instrument]
    end

    test "get_instrument!/1 returns the instrument with given id" do
      instrument = instrument_fixture()
      assert Core.get_instrument!(instrument.id) == instrument
    end

    test "create_instrument/1 with valid data creates a instrument" do
      assert {:ok, %Instrument{} = instrument} = Core.create_instrument(@valid_attrs)
      assert instrument.code == "some code"
      assert instrument.description == "some description"
      assert instrument.name == "some name"
    end

    test "create_instrument/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_instrument(@invalid_attrs)
    end

    test "update_instrument/2 with valid data updates the instrument" do
      instrument = instrument_fixture()
      assert {:ok, %Instrument{} = instrument} = Core.update_instrument(instrument, @update_attrs)
      assert instrument.code == "some updated code"
      assert instrument.description == "some updated description"
      assert instrument.name == "some updated name"
    end

    test "update_instrument/2 with invalid data returns error changeset" do
      instrument = instrument_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_instrument(instrument, @invalid_attrs)
      assert instrument == Core.get_instrument!(instrument.id)
    end

    test "delete_instrument/1 deletes the instrument" do
      instrument = instrument_fixture()
      assert {:ok, %Instrument{}} = Core.delete_instrument(instrument)
      assert_raise Ecto.NoResultsError, fn -> Core.get_instrument!(instrument.id) end
    end

    test "change_instrument/1 returns a instrument changeset" do
      instrument = instrument_fixture()
      assert %Ecto.Changeset{} = Core.change_instrument(instrument)
    end
  end

  describe "transactions" do
    alias Investments.Core.Transaction

    @valid_attrs %{date_close: ~N[2010-04-17 14:00:00], date_open: ~N[2010-04-17 14:00:00], unit_buy_price: 120.5, unit_sell_price: 120.5}
    @update_attrs %{date_close: ~N[2011-05-18 15:01:01], date_open: ~N[2011-05-18 15:01:01], unit_buy_price: 456.7, unit_sell_price: 456.7}
    @invalid_attrs %{date_close: nil, date_open: nil, unit_buy_price: nil, unit_sell_price: nil}

    def transaction_fixture(attrs \\ %{}) do
      {:ok, transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_transaction()

      transaction
    end

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Core.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Core.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      assert {:ok, %Transaction{} = transaction} = Core.create_transaction(@valid_attrs)
      assert transaction.date_close == ~N[2010-04-17 14:00:00]
      assert transaction.date_open == ~N[2010-04-17 14:00:00]
      assert transaction.unit_buy_price == 120.5
      assert transaction.unit_sell_price == 120.5
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{} = transaction} = Core.update_transaction(transaction, @update_attrs)
      assert transaction.date_close == ~N[2011-05-18 15:01:01]
      assert transaction.date_open == ~N[2011-05-18 15:01:01]
      assert transaction.unit_buy_price == 456.7
      assert transaction.unit_sell_price == 456.7
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_transaction(transaction, @invalid_attrs)
      assert transaction == Core.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Core.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Core.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Core.change_transaction(transaction)
    end
  end
end
