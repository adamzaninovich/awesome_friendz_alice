defmodule AwesomeFriendzAlice.Mixfile do
  use Mix.Project

  def project do
    [app: :awesome_friendz_alice,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:alice],
      mod: {
        Alice, [
          Alice.Handlers.Random,
          Alice.Handlers.OhYouSo,
          Alice.Handlers.GoogleImages,
          Alice.Handlers.AgainstHumanity
        ] } ]
  end

  defp deps do
     [
       {:websocket_client, github: "jeremyong/websocket_client"},
       {:alice, path: "~/projects/alice"},
       {:alice_against_humanity, github: "adamzaninovich/alice_against_humanity"}
     ]
  end
end
