# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :primewolf,
  ecto_repos: [Primewolf.Repo]

# Configures the endpoint
config :primewolf, PrimewolfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Udnh6KmQ9hW9idMlqs0UhpNiCwbBUMWi7vNhzY9S4UU+ZyMn3BHm3K61Ow6iQp9s",
  render_errors: [view: PrimewolfWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Primewolf.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
