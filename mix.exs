defmodule AwesomeFriendzAlice.Mixfile do
  use Mix.Project

  def project do
    [
      app: :awesome_friendz_alice,
      version: "0.2.3",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:alice_reddit, :alice_doge_me],
      mod: {Alice, %{}}
    ]
  end

  defp deps do
    [
      {:alice, github: "alice-bot/alice", override: true},
      # {:alice, path: "~/projects/alice/alice", override: true},
      # {:alice, "~> 0.4.2", override: true},
      {:poison, "~> 4.0", override: true},
      {:httpoison, "~> 0.13", override: true},
      {:alice_against_humanity, "~> 0.1"},
      {:alice_google_images, "~> 0.1"},
      {:alice_karma, "~> 0.3"},
      {:alice_shizzle, "~> 0.1"},
      {:alice_reddit, "~> 0.1"},
      {:alice_doge_me, "~> 0.1"},
      {:alice_eats, "~> 0.1"},
      {:alice_wiki, "~> 1.0"},
      {:alice_weather, github: "alice-bot/alice_weather", branch: "master"},
      {:alice_haha, "~> 2.0"},
      # {:alice_good_morning, "~> 1.0"},
      {:alice_good_morning, github: "tielur/alice_good_morning", branch: "master"},
      {:alice_roller, "~> 0.3"}
    ]
  end
end
