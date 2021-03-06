defmodule MyEnum do
  import Clone
  clone Enum

  def last([]), do: nil
  def last([element]), do: element
  def last([_ | tail] = list) when is_list(list) do
    last(tail)
  end
end

ExUnit.start()
