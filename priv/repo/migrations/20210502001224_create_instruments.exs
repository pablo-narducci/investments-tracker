defmodule Investments.Repo.Migrations.CreateInstruments do
  use Ecto.Migration

  def change do
    create table(:instruments) do
      add :code, :string
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
