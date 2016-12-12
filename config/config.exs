# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kot_backend,
  namespace: Kot,
  ecto_repos: [Kot.Repo]

# Configures the endpoint
config :kot_backend, Kot.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NWRWaxLq01mQGwwP3wrsKzv1+E1no6g17TTv+Pw8JyzMOfLIBNpxsowhBNm/DFH7",
  render_errors: [view: Kot.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
