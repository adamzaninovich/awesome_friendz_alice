defmodule AwesomeFriendzAlice.Mixfile do
  use Mix.Project

  def project do
    [ app: :awesome_friendz_alice,
      version: "0.2.3",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps() ]
  end

  def application do
    [
      applications: [:alice, :alice_reddit, :alice_doge_me],
      mod: {Alice, %{handlers: handlers()}}
    ]
  end

  defp handlers do
    [
      Alice.Handlers.Random,
      Alice.Handlers.GrammarNazi,
      Alice.Handlers.OhYouSo,
      Alice.Handlers.AgainstHumanity,
      Alice.Handlers.GoogleImages,
      Alice.Handlers.Karma,
      Alice.Handlers.Shizzle,
      Alice.Handlers.Xkcd,
      Alice.Handlers.Reddit,
      Alice.Handlers.Dogeme,
      Alice.Handlers.Eats
    ]
  end

  defp deps do
     [
       {:alice, github: "alice-bot/alice", branch: "master", override: true},
       {:httpoison,                "0.11.0", override: true},
       {:alice_against_humanity,   "~> 0.1"},
       {:alice_google_images,      "~> 0.1"},
       {:alice_karma,              "~> 0.3"},
       {:alice_shizzle,            "~> 0.1"},
       {:alice_xkcd,               "~> 0.0"},
       {:alice_reddit,             "~> 0.0.4"},
       {:alice_doge_me,            "~> 0.1.0"},
       {:alice_eats,               "~> 0.1.0"}
     ]
  end
end
