defmodule NostrApp.Subscribe do
  require Logger

  alias Nostr.Client

  def to_profile(public_key) do
    case Client.subscribe_profile(public_key) do
      {:ok, _} -> Logger.info("Subscribed to #{public_key}'s profile")
      {:error, message} -> Logger.warn(message)
    end
  end

  def to_contacts(public_key) do
    case Client.subscribe_contacts(public_key) do
      {:ok, _} -> Logger.info("Subscribed to #{public_key}'s contact list")
      {:error, message} -> Logger.warn(message)
    end
  end

  def to_note(note_id) do
    case Client.subscribe_note(note_id) do
      {:ok, _} -> Logger.info("Subscribed to this note: #{note_id}")
      {:error, message} -> Logger.warn(message)
    end
  end

  def to_notes(public_keys) do
    case Client.subscribe_notes(public_keys) do
      {:ok, _} -> Logger.info("Subscribed to notes from: #{public_keys}")
      {:error, message} -> Logger.warn("#{inspect(message)}")
    end
  end

  def to_encrypted_direct_messages(private_key) do
    case Client.encrypted_direct_messages(private_key) do
      {:ok, _} -> Logger.info("Subscribed to #{private_key}'s encrypted messages")
      {:error, message} -> Logger.warn("#{inspect(message)}")
    end
  end
end
