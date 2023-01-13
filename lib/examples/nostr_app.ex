defmodule NostrApp do
  alias NostrApp.Server

  def start_link(relays, <<_::256>> = private_key) do
    args = %{relays: relays, private_key: private_key}

    GenServer.start_link(Server, args, name: Server)
  end

  def send_note(note) do
    GenServer.cast(Server, {:send_note, note})
  end

  def react(note_id) do
    GenServer.cast(Server, {:react, note_id})
  end

  def profile(pubkey) do
    GenServer.cast(Server, {:profile, pubkey})
  end

  def contacts(pubkey) do
    GenServer.cast(Server, {:contacts, pubkey})
  end

  def follow(pubkey) do
    GenServer.cast(Server, {:follow, pubkey})
  end

  def unfollow(pubkey) do
    GenServer.cast(Server, {:unfollow, pubkey})
  end

  def note(note_id) do
    GenServer.cast(Server, {:note, note_id})
  end

  def notes(pubkey) do
    GenServer.cast(Server, {:notes, pubkey})
  end

  def deletions(pubkeys) when is_list(pubkeys) do
    GenServer.cast(Server, {:deletions, pubkeys})
  end

  def reposts(pubkeys) when is_list(pubkeys) do
    GenServer.cast(Server, {:reposts, pubkeys})
  end

  def reactions(pubkeys) when is_list(pubkeys) do
    GenServer.cast(Server, {:reactions, pubkeys})
  end

  def timeline(pubkey) do
    GenServer.cast(Server, {:timeline, pubkey})
  end
end
