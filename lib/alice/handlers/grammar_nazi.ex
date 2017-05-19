defmodule Alice.Handlers.GrammarNazi do
  use Alice.Router
  @moduledoc "Corrects your terrible grammar. Not an actual Nazi."

  alias Alice.Conn

  route ~r/\bwould of\b/i, :would_of
  route ~r/\bcould of\b/i, :could_of
  route ~r/\bshould of\b/i, :should_of

  @doc false
  def would_of(conn), do: correct_of(conn, "would")

  @doc false
  def could_of(conn), do: correct_of(conn, "could")

  @doc false
  def should_of(conn), do: correct_of(conn, "should")

  @doc false
  def correct_of(conn, word) do
    delayed_reply(~s(or maybe "#{word} have"), 1200, conn)
    delayed_reply("Anyway, you're welcome! :+1:", 3600, conn)
    reply(conn, ~s(Hey #{Conn.at_reply_user(conn)}, I think you mean "#{word}'ve"))
  end
end
