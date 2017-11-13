# Clone

[![Build Status](https://travis-ci.org/kelostrada/clone.svg?branch=master)](https://travis-ci.org/kelostrada/clone)

## Installation

The package can be installed by adding `clone` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:clone, "~> 0.1.0"}
  ]
end
```

## Example usage

At the begining of your module add `use Clone, {Module}` or `import Clone` and
use macro `clone {Module}`.

```elixir

defmodule MyEnum do
  use Clone, Enum

  def last([]), do: nil
  def last([element]), do: element
  def last([_ | tail] = list) when is_list(list) do
    last(tail)
  end
end

iex> MyEnum.last([1,2,3])
3

iex> MyEnum.min([1,2,3,0,2])
0


defmodule MyEnum do
  import Clone
  clone Enum

  def last([]), do: nil
  def last([element]), do: element
  def last([_ | tail] = list) when is_list(list) do
    last(tail)
  end
end

iex> MyEnum.last([1,2,3])
3

iex> MyEnum.min([1,2,3,0,2])
0

```
