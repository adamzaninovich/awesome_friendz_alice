defmodule Alice.Handlers.Feedback do
  use Alice.Router
  @moduledoc "Lets users provide feedback (by opening an issue in github) conveniently."

  alias Alice.Conn

  command ~r/> (handler-idea|bug|feedback) (.+)/i, :feedback

  @doc """
  `<label> <title>` - Create a GitHub Issue on alice-bot/alice repository.
  Possible labels are `feedback`, `handler-idea`, `bug`.
  """

  def feedback(%Conn{message: %{captures: captures}}=conn) do
    [_full, label, feedback] = captures
    delayed_reply(~s(Thank you for providing feedback #{Conn.at_reply_user(conn)}), 1200, conn)
    reply(conn, ~s(Please click #{github_issues_url(label, feedback)} to review and submit a ticket.))
  end

  defp github_issues_url(label, feedback) do
    label
    |> String.downcase
    |> format_label
    |> encoded_query(feedback)
    |> URI.encode_query
    |> build_url
  end

  defp format_label("handler-idea"), do: "handler idea"
  defp format_label(label), do: label

  defp format_feedback(feedback), do: feedback |> String.trim_leading |> String.capitalize

  defp encoded_query(label, feedback), do: %{"labels" => label, "title" => format_feedback(feedback)}

  defp build_url(encoded_query), do: "github.com/alice-bot/alice/issues/new?#{encoded_query}"
end
