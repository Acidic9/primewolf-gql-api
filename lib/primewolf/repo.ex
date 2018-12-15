defmodule PrimeWolf.Repo do
  use Ecto.Repo,
    otp_app: :primewolf,
    adapter: Ecto.Adapters.Postgres
end
