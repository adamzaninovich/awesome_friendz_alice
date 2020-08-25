defmodule Alice.Handlers.Random do
  use Alice.Router

  alias Alice.Conn

  # Routes

  command(~r/\bplay (.+)\z/i, :play)
  route(~r/\bgoo+d ?morning!*\b/i, :good_morning)
  route(~r/\bflowery bullshit\b/i, :flowery_bullshit)
  route(~r/\btro+l+(o+l+)+(o+)?\b/i, :trololol)
  route(~r/\btable ?flip\b/i, :table_flip)
  route(~r/\bbig ?data\b/i, :big_data)
  route(~r/\bcocaine\b/i, :cocaine)
  route(~r/\bdemeter\b/i, :say_demeter_again)
  route(~r/\bbusted\b/i, :busted)
  route(~r/\bdev[- ]?ops\b/i, :devops)
  route(~r/\bIT IS DECIDED\!?\b/, :it_is_decided)
  route(~r/\bmadness\b/i, :this_is_sparta)
  route(~r/\bmind blown\b/i, :mind_blown)
  route(~r/\bthank(s| you),? alice\b/i, :thanks)
  command(~r/thank(s| you)/i, :thanks)
  route(~r/\b((fuck you|wtf|damn? ?(it|you)),?|bad) alice\b/i, :bad_alice)
  command(~r/(fuck you|wtf|damn? ?(it|you))/i, :bad_alice)
  route(~r/\b(a+w+ ?y+i+s+|bread ?crumbs)!*\b/i, :aww_yiss)
  route(~r/\bdark ?souls?\b/i, :i_dont_care)
  route(~r/\bthe games?\b/i, :the_game)
  route(~r/\b(I )?(luv|love|:heart:) (yo)?u,? alice\b/i, :alice_love)
  route(~r/\balice,? I (love|:heart:) you\b/i, :alice_love)
  command(~r/\bI (love|:heart:) you\b/i, :alice_love)
  command(~r/\bdie\b/i, :die)
  route(~r/\bmic ?drop\b/i, :mic_drop)
  route(~r/\bdrop ?(the)? ?mic\b/i, :mic_drop)
  route(~r/\bclear ?(your)? ?cache\??\b/i, :cache_bug)
  route(~r/\b(dis|this)( is)? gon(na)? be? g(u|oo)d\b/i, :dis_gon_b_gud)
  route(~r/\b(wub ?(wub)?|dub(step)?|d+rop.*bas(s|e))\b/i, :dddddrop_the_bass)
  route(~r/\b(mad|angry|rage)\b/i, :u_mad_bro)
  route(~r/\Ano+pe+\!+\z/i, :nope_nope_nope)
  route(~r/\bgooo+d\b/i, :goooood)
  route(~r/\bto+t(ally|es)\b/i, :toooootally)
  command(~r/\beggplant me\z/i, :single_eggplant)
  command(~r/\beggplant me (\d+)\z/i, :multi_eggplant)
  command(~r/\ba?re? (yo)?u high\??/i, :are_you_high)
  route(~r/(?<!img me este haim )bass ?face/i, :bass_face)
  command(~r/\b(toast|bear) me\z/i, :single_toast)
  command(~r/\b(toast|bear) me (\d+)\z/i, :multi_toast)
  route(~r/\bTHANK YOU!?\b/, :thank_you)
  route(~r/\b(a )?(javascript|js) framework\b/i, :js_framework)

  def js_framework(conn) do
    js = Conn.last_capture(conn)

    new_message =
      conn.message.text
      |> String.replace(js, "_another_ #{js}")
      |> String.replace("a _another_", "_another_")

    reply(conn, ~s(you mean "#{new_message}"?))
  end

  @doc "`play Despacito 2` - attempts to play a song"
  def play(conn) do
    song = Alice.Conn.last_capture(conn)

    """
    ɴᴏᴡ ᴘʟᴀʏɪɴɢ: #{song}

    ───────────────────────────────:white_circle:────────────

    ◄◄⠀▐▐ ⠀►►⠀⠀ ⠀ 2:57 / 3:48 ⠀ ───○ :loud_sound:⠀ ᴴᴰ :gear: ❐ ⊏⊐
    """
    |> reply(conn)
  end

  @doc false
  def flowery_bullshit(conn), do: "http://i.imgur.com/ioLp3DW.jpg" |> reply(conn)

  @doc false
  def good_morning(conn) do
    chance_reply(conn, 0.01, "http://i.imgur.com/ioLp3DW.jpg")
  end

  @doc false
  def trololol(conn), do: "http://i.imgur.com/ynr0Qms.gif" |> reply(conn)

  @doc false
  def table_flip(conn), do: "http://i.imgur.com/IFabn5c.gif" |> reply(conn)

  @doc "`big data`/`bigdata` - BIG data"
  def big_data(conn), do: "http://i.imgur.com/U6m4s4o.jpg" |> reply(conn)

  @doc "`cocaine` - ba ba da ba ba da cocaine!"
  def cocaine(conn) do
    ~w[
      http://i.imgur.com/A3QICEQ.gif
      http://i.imgur.com/biaviGH.gif
      http://i.imgur.com/rIKgVmY.gif
      http://i.imgur.com/Oi6QYeH.jpg
      http://i.imgur.com/Pa9SOFY.gif
    ]
    |> random_reply(conn)
  end

  @doc "`demeter` - try me"
  def say_demeter_again(conn), do: "http://i.imgur.com/Z0jvLNm.jpg" |> reply(conn)

  @doc "`busted` - get busted by Mr. Biggs"
  def busted(conn), do: "http://i.imgur.com/MasM57I.png" |> reply(conn)

  @doc "`devops`/`dev-ops`/`dev ops` - ops problem now!"
  def devops(conn), do: "http://i.imgur.com/6sNQ3yt.jpg" |> reply(conn)

  @doc "`IT IS DECIDED` - nail that decision coffin"
  def it_is_decided(conn), do: "http://i.imgur.com/80PQSCo.gif" |> reply(conn)

  @doc "`mind blown` - blow your mind"
  def mind_blown(conn), do: "http://i.imgur.com/lr4KJPQ.gif" |> reply(conn)

  @doc "`madness` - THIS IS SPARTA"
  def this_is_sparta(conn), do: "http://i.imgur.com/ydJ3Vcr.jpg" |> reply(conn)

  @doc "Either `thanks alice` or `@alice thanks` - tell Alice thanks"
  def thanks(conn), do: "no prob, bob" |> reply(conn)

  @doc false
  def bad_alice(conn) do
    ~w[
      https://i.imgur.com/pcj45CQ.gif
      https://i.imgur.com/PP0ICsx.gif
      https://i.imgur.com/PiSYqpq.gif
      https://i.imgur.com/jGGUWyo.gif
      https://i.imgur.com/Q5tqiCq.gif
      https://i.imgur.com/kaQnevF.gif
      https://i.imgur.com/oFNPOQ0.gif
    ]
    |> random_reply(conn)
  end

  @doc "`aww yiss`/`bread crumbs` - motha fuckin' bread crumbs"
  def aww_yiss(conn) do
    ~w[http://i.imgur.com/SEQTUr3.jpg http://i.imgur.com/znLCJe3.gif http://i.imgur.com/6yJXSqr.gif]
    |> random_reply(conn)
  end

  @doc "`dark souls` - find out just how much Alice cares about Dark Souls"
  def i_dont_care(conn), do: "http://i.imgur.com/29A4xj5.gif" |> reply(conn)

  @doc ":troll:"
  def the_game(%Conn{message: %{text: text}} = conn) do
    the_game(conn, String.downcase(text))
  end

  def the_game(conn, "i lost the game"), do: conn

  def the_game(%Conn{message: %{channel: channel}} = conn, _) do
    :calendar.universal_time()
    |> :calendar.datetime_to_gregorian_seconds()
    |> game_response(get_state(conn, {:next_loss, channel}, 0), conn)
  end

  defp game_response(now, next_loss, conn) when now < next_loss, do: conn

  defp game_response(now, _, conn = %Conn{message: %{channel: channel}}) do
    conn
    |> put_state({:next_loss, channel}, now + 30 * 60)
    |> chance_reply(0.25, "http://i.imgur.com/Z8awIpt.png", "I lost the game")
  end

  @doc """
  Express some love for Alice
      `I love you alice`
      `I `:heart:` you, alice`
      `alice, I love`/:heart:` you`
      `@alice I love`/:heart:` you`
  """
  def alice_love(%Conn{message: %{user: "U0LADD3C4"}} = conn) do
    reply(conn, "aww, we're such good friends, #{Conn.at_reply_user(conn)}! :+1:")
  end

  def alice_love(conn) do
    [love | _rest] = conn.message.captures |> Enum.reverse()
    emoji = Enum.random(~w[:wink: :heart_eyes: :kissing_heart: :hugging_face:])
    "aww, I #{love} you too, #{Conn.at_reply_user(conn)}! #{emoji}" |> reply(conn)
  end

  @doc "`die` - request that Alice die. You might not like the response"
  def die(conn) do
    delayed_reply("go fuck yourself", 1200, conn)
    reply("hey #{Conn.at_reply_user(conn)}...", conn)
  end

  @doc "`mic drop` - drop the mic"
  def mic_drop(conn) do
    ~w[http://i.imgur.com/MpEqxwM.gif
      http://i.imgur.com/YANYG8d.gif
      http://i.imgur.com/ZxZUyH9.gif
      http://i.imgur.com/9XVQlvS.gif
      http://i.imgur.com/XTWiamq.gif
      http://i.imgur.com/3hkSF89.gif]
    |> random_reply(conn)
  end

  @doc "`clear your cache` - you may have a cache bug if..."
  def cache_bug(conn) do
    ~w[http://i.imgur.com/mus48mo.jpg
      http://i.imgur.com/Mt669js.png
      http://i.imgur.com/OzI9RZq.jpg]
    |> random_reply(conn)
  end

  @doc "`dis gon b gud`/`this is gonna to be good` - sit back and enjoy the show"
  def dis_gon_b_gud(conn) do
    ~w[http://i.imgur.com/j7PKhl1.gif
      http://i.imgur.com/mtHKey3.gif
      http://i.imgur.com/uh5A6.gif
      http://i.imgur.com/o3o1fU3.gif]
    |> random_reply(conn)
  end

  @doc """
  Epic Bass Drop Time
      `dddddddrop the bass`
      `wub wub`
      `dubstep`
  """
  def dddddrop_the_bass(conn) do
    ~w[
      https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr03/2013/2/15/9/anigif_enhanced-buzz-27236-1360939858-5.gif
      https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr01/2013/2/15/9/anigif_enhanced-buzz-5139-1360939681-14.gif
      https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr02/2013/2/15/11/enhanced-buzz-3235-1360947432-2.jpg
      http://i1212.photobucket.com/albums/cc460/bbtlv/dubstep.gif
      http://i.imgur.com/kUtovs7.gif
    ]
    |> random_reply(conn)
  end

  @doc "`mad`/`angry`/`rage` - u mad bro?"
  def u_mad_bro(conn) do
    ~w[https://i.imgur.com/zesJtxt.gif
      https://i.imgur.com/T3xObA8.jpg
      http://i.imgur.com/KEh9WOT.png
      http://i.imgur.com/LupvkMH.jpg]
    |> random_reply(conn)
  end

  @doc "`nope` - nope nope nope"
  def nope_nope_nope(conn) do
    ~w[http://i.imgur.com/ZG8Y5XQ.gif
      http://i.imgur.com/Bebd11u.gif
      http://i.imgur.com/piqluC8.jpg
      http://i.imgur.com/UUoYZjM.jpg
      http://i.imgur.com/oQsSbYC.gif
      http://i.imgur.com/HIN4HrI.gif
      http://i.imgur.com/yBE4JbR.jpg
      http://i.imgur.com/DgczUtV.png
      http://i.imgur.com/RgylcEM.png
      http://i.imgur.com/qJC1zLM.jpg
      http://i.imgur.com/LRBIPMP.png]
    |> random_reply(conn)
  end

  @doc "`goood` - embrace your hate"
  def goooood(conn) do
    ~w[http://i.imgur.com/1jtr4HM.png
      http://i.imgur.com/j83QRp7.png
      http://i.imgur.com/rm8NcQC.jpg
      http://i.imgur.com/nmC7Hnb.jpg]
    |> random_reply(conn)
  end

  @doc "`totally` - totes magotes"
  def toooootally(conn) do
    chance_reply(conn, 0.2, "http://i.imgur.com/XuTdELg.jpg", generate_totally())
  end

  defp generate_totally, do: "to#{String.duplicate("o", Enum.random(0..9))}tally"

  @doc "`toast me` - makes happy toast"
  def single_toast(conn), do: toast(1, conn)

  @doc "`toast me (num)` - makes many happy toastes"
  def multi_toast(conn) do
    conn
    |> Conn.last_capture()
    |> String.to_integer()
    |> toast(conn)
  end

  defp toast(num, conn) do
    Enum.reduce(1..num, "ʕ", fn _n, toasts ->
      toasts <> "•̫͡•" <> Enum.random(["ʕ", "ʔ"])
    end)
    |> String.replace_suffix("ʕ", "ʔ")
    |> reply(conn)
  end

  @doc "`eggplant me` - get an eggplant from Alice"
  def single_eggplant(conn), do: eggplant(1, conn)

  @doc "`eggplant me (num)` - get many eggplants from Alice"
  def multi_eggplant(conn) do
    conn
    |> Conn.last_capture()
    |> String.to_integer()
    |> eggplant(conn)
  end

  defp eggplant(num, conn) do
    ":eggplant: "
    |> String.duplicate(num)
    |> reply(conn)
  end

  @doc false
  def are_you_high(conn), do: "http://i.imgur.com/gdnNcF1.jpg" |> reply(conn)

  def bass_face(conn) do
    new_message = Map.put(conn.message, :text, "img me este haim bass face")
    Alice.ChatBackends.Slack.handle_event(new_message, conn.slack, conn.state)
    conn
  end

  @doc "`THANK YOU`"
  def thank_you(conn) do
    reply(conn, "https://i.imgur.com/IIYzC0H.png")
  end
end
