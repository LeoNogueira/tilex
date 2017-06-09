use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tilex, Tilex.Endpoint,
  http: [port: 4001],
  server: true

config :tilex, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tilex, Tilex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "tilex_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wallaby, screenshot_on_failure: true

config :tilex, :page_size, 5
config :tilex, :auth_controller, Test.AuthController
config :tilex, :slack_notifier, Test.Slack
config :tilex, :twitter_notifier, Test.Twitter
config :tilex, :organization_name, "Hashrocket"
