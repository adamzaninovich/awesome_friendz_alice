defmodule Alice.Handlers.GrammarNazi do
  use Alice.Router
  @moduledoc "Corrects your terrible grammar. Not an actual Nazi. Does not condone Nazis."

  alias Alice.Conn

  route ~r/\b(((w|c|sh)ould(n't)?)|must) of\b/i, :correct_of

  @doc "Corrects your terrible grammar. Not an actual Nazi."
  def correct_of(%Conn{message: %{captures: captures, user: "U0LADD3C4"}}=conn) do
    [_full, word | _rest] = captures
    delayed_reply(~s(or maybe "#{word} have"), 1200, conn)
    delayed_reply("Anyway, you're welcome! :+1:", 3600, conn)
    delayed_reply("But seriously, you haven't learned by now?", 4500, conn)
    delayed_reply("I mean, it's not that hard.", 5000, conn)
    delayed_reply("I believe in you #{Conn.at_reply_user(conn)}", 6000, conn)
    delayed_reply("You can do it!", 7000, conn)
    delayed_reply("Also, here are some flowers: http://i.imgur.com/ioLp3DW.jpg", 10000, conn)
    reply(conn, ~s(Hey #{Conn.at_reply_user(conn)}, I think you mean "#{word}'ve"))
  end
  def correct_of(%Conn{message: %{captures: captures}}=conn) do
    [_full, word | _rest] = captures
    delayed_reply(~s(or maybe "#{word} have"), 1200, conn)
    delayed_reply("Anyway, you're welcome! :+1:", 3600, conn)
    reply(conn, ~s(Hey #{Conn.at_reply_user(conn)}, I think you mean "#{word}'ve"))
  end
end
