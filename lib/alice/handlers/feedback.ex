defmodule Alice.Handlers.Feedback do
  use Alice.Router
  @moduledoc "Lets users provide feedback (by opening an issue in github) conveniently."

  alias Alice.Conn

  route ~r/\b(feedback|idea|bug|enhancement|suggestion) *for *alice *:?(.+)/i, :feedback

  @doc """
  `feedback\idea\suggestion\enhancement\bug for alice(:) some feedback details`
  Opens a Github issue with the provided feedback details and the type of feedback
  applied as a label
  """
  def feedback(%Conn{message: %{captures: captures}}=conn) do
    [_full, label, feedback] = captures
    delayed_reply(~s(Please click #{github_issues_url(label, feedback)} to review and submit a ticket.), 1200, conn)
    reply(conn, ~s(Thank you for providing feedback #{Conn.at_reply_user(conn)}))
  end

  defp github_issues_url(label, feedback) do
    label
    |> format_label
    |> encoded_query(String.trim_leading(feedback))
    |> URI.encode_query
    |> build_url
  end

  defp format_label(label), do: if label in ~w(feedback idea suggestion enhancement), do: "enhancement", else: label

  defp encoded_query(label, feedback), do: %{ "labels" => label, "title" => feedback }

  defp build_url(encoded_query), do: "github.com/alice-bot/alice/issues/new?" <> encoded_query
end
