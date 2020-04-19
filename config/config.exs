use Mix.Config

config :alice,
  handlers: [
    Alice.Handlers.Random,
    Alice.Handlers.GrammarNazi,
    Alice.Handlers.OhYouSo,
    Alice.Handlers.Feedback,
    Alice.Handlers.AgainstHumanity,
    Alice.Handlers.GoogleImages,
    Alice.Handlers.Karma,
    Alice.Handlers.Shizzle,
    Alice.Handlers.Reddit,
    Alice.Handlers.Dogeme,
    Alice.Handlers.Eats,
    Alice.Handlers.Wiki,
    Alice.Handlers.Weather,
    Alice.Handlers.Haha,
    Alice.Handlers.GoodMorningLanguages,
    Alice.Handlers.Roller
  ]


config :alice_google_images,
  cse_id: System.get_env("GOOGLE_CSE_ID"),
  cse_token: System.get_env("GOOGLE_CSE_TOKEN"),
  safe_search_level: :medium

config :awesome_friendz_alice,
  bitly_token: "c12043a1cedb06f76a46d3765a41b4dfa41df3fb"

config :alice_weather,
  api_key: System.get_env("DARKSKY_API_KEY")

config :geocodex,
  api_key: System.get_env("GOOGLE_GEOCODING_API_KEY")

config :geocodex,
  geocode_api_url: "https://maps.googleapis.com/maps/api/geocode"

case Mix.env do
  env when env in [:prod, :dev] -> import_config "#{env}.exs"
  _other                        -> import_config "other.exs"
end
