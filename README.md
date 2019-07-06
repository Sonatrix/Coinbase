# Coinbase

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `coinbase` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coinbase, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/coinbase](https://hexdocs.pm/coinbase).

Cryptocurrency exchanges usually open their realtime feed for free and, like Coinbase Pro, without even having to create an account. This gives us a great way to build an architecture around realtime market data. In this article we see how to build an Elixir application to get realtime updates from the coinbase websocket feed, handling crashes and disconnections.
