use Mix.Config

config :alice,
  adapter: Alice.Adapters.REPL,
  # api_key: System.get_env("LAASY_SLACK_KEY"),
  state_backend: :redis,
  redis: "redis://localhost"

config :logger, :level, :error
