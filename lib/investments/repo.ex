defmodule Investments.Repo do
  use Ecto.Repo,
    otp_app: :investments,
    adapter: Ecto.Adapters.Postgres
end
