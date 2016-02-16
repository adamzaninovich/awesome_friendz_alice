defmodule AwesomeFriendzAlice.Mixfile do
  use Mix.Project

  def project do
    [ app: :awesome_friendz_alice,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps ]
  end

  def application do
    [ applications: [:alice],
      mod: {
        Alice, [
          Alice.Handlers.Random,
          Alice.Handlers.OhYouSo,
          Alice.Handlers.AgainstHumanity,
          Alice.Handlers.GoogleImages,
          Alice.Handlers.Karma
        ] } ]
  end

  defp deps do
     [
       {:websocket_client, github: "jeremyong/websocket_client"},
       {:alice,                  "~> 0.1.1"},
       {:alice_against_humanity, "~> 0.0.1"},
       {:alice_google_images,    "~> 0.0.1"},
       {:alice_karma,            "~> 0.0.1"}
     ]
  end
end
