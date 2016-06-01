# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :bangers_and_mash, BangersAndMash.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "YTYXzEfYm65T05TlwI/gkq/Y4TnmtU3B1JZUX1m8EKVUJW1Lu7ak/yjieyLBRqcQ",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: BangersAndMash.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Hound configuration
config :hound, driver: "phantomjs"

# Set compiler options to allow re-difiniton of Modules
Code.compiler_options ignore_module_conflict: true
