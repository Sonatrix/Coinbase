defmodule Coinbase.Client do
  use WebSockex

  @url "wss://ws-feed.pro.coinbase.com"

  def start_link(products \\ []) do
    {:ok, pid} = WebSockex.start_link(@url, __MODULE__, :no_state)
    subscribe(pid, products)
    {:ok, pid}
  end
  
  def handle_connect(conn, state) do
    IO.puts "Connected!"
    {:ok, state}
  end

  def subscription_frame(products) do

    subscription_msg = %{
    
      type: "subscribe",
      product_ids: products,
      channels: ["matches"]
    
    } |> Poison.encode!()
  
      {:text, subscription_msg}
  end

  def subscribe(pid, products) do
    frame = subscription_frame(products)
    WebSockex.send_frame(pid, frame)
  end

  def handle_frame({:text, msg}, state) do
    handle_msg(Poison.decode!(msg), state)
  end

  defp handle_msg(%{"type" => "match"} = trade, state) do
    IO.inspect(trade)
    {:ok, state}
  end

  defp handle_msg(trade, state) do
    {:ok, state}
  end

  def handle_disconnect(_conn, state) do
    IO.puts("disconnected")
    {:ok, state}
  end

end