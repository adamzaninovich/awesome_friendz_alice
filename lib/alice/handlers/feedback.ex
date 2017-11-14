defmodule Alice.Handlers.Feedback do
  @moduledoc """
  Lets users provide feedback conveniently by opening an issue in GitHub
  """

  use Alice.Router

  alias Alice.Conn
  alias HTTPoison.Response, as: Resp

  command ~r/> (handler-idea|bug|feedback) (.+)/i, :feedback

  @doc """
  `<label> <title>` - Create a GitHub Issue on alice-bot/alice repository.
  Possible labels are `feedback`, `handler-idea`, `bug`.
  """

  def feedback(%Conn{message: %{captures: [_full, label, title]}}=conn) do
    reply(conn, "Thank you for your feedback!")
    reply(conn, "Please click #{github_issues_url(label, title)} to review and finialize your submission.")
  end

  defp github_issues_url(label, title) do
    label
    |> prepare_label()
    |> encode_query(prepare_title(title))
    |> build_url()
    |> attempt_url_shortening()
    |> remove_protocol()
  end

  defp remove_protocol("https://" <> url), do: url
  defp remove_protocol("http://" <> url), do: url
  defp remove_protocol(url), do: url

  defp prepare_label(label) do
    label
    |> String.downcase
    |> format_label
  end

  defp format_label("handler-idea"), do: "handler idea"
  defp format_label(label), do: label

  defp prepare_title(title) do
    title
    |> String.trim_leading
    |> String.capitalize
  end

  defp encode_query(label, title) do
    URI.encode_query(%{
      labels: "#{label},added by feedback handler",
      title: title
    })
  end

  defp build_url(encoded_query) do
    "https://github.com/alice-bot/alice/issues/new?#{encoded_query}"
  end

  defp attempt_url_shortening(url) do
    base = "https://api-ssl.bitly.com/v3/shorten"
    token = Application.get_env(:awesome_friendz_alice, :bitly_token)
    HTTPoison.get(base, [], params: [access_token: token, longUrl: url, format: "txt"])
    |> handle_short_url_response(url)
  end

  defp handle_short_url_response({:ok, %Resp{status_code: 200, body: short_url}}, _long_url) do
    short_url
  end
  defp handle_short_url_response(_bad_response, long_url), do: long_url
end
