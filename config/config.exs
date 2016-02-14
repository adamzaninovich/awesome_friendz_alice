use Mix.Config

config :alice, :google_images_cse_id, System.get_env("GOOGLE_CSE_ID")
config :alice, :google_images_cse_token, System.get_env("GOOGLE_CSE_TOKEN")
config :alice, :google_images_safe_search_level, :medium

case Mix.env do
  env when env in [:prod, :dev] -> import_config "#{env}.exs"
  _other                        -> import_config "other.exs"
end
