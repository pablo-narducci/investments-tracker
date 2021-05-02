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
end
