use Mix.Config

config :alice_google_images,
  cse_id: System.get_env("GOOGLE_CSE_ID"),
  cse_token: System.get_env("GOOGLE_CSE_TOKEN"),
  safe_search_level: :medium

config :alice, :handlers, [
    Alice.Handlers.Random,
    Alice.Handlers.OhYouSo,
    Alice.Handlers.AgainstHumanity,
    Alice.Handlers.GoogleImages,
    Alice.Handlers.Karma,
    Alice.Handlers.Shizzle,
    Alice.Handlers.Xkcd,
    Alice.Handlers.Reddit,
    Alice.Handlers.TielursHeartRate
  ]

case Mix.env do
  env when env in [:prod, :dev] -> import_config "#{env}.exs"
  _other                        -> import_config "other.exs"
end
