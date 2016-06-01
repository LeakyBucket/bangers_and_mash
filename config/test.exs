use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bangers_and_mash, BangersAndMash.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bangers_and_mash, BangersAndMash.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bangers_and_mash_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :bangers_and_mash, step_directory: "test/support/browser/steps/"
config :bangers_and_mash, browser_test_directory: "test/support/browser/tests/"
config :bangers_and_mash, web_ui_directory: "test/support/integrations/web/"
