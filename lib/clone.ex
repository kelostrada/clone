defmodule Clone do
  @moduledoc """
  Clone / Rewrite modules for instance to extend they functionality

  ## Examples

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
  """

  defmacro __using__(module) when is_atom(module) do
    quote do

    end
  end
  defmacro __using__({_, _, module}) do
    module = Module.concat(module)

    Enum.map module.__info__(:functions), fn({method, arg_count}) ->
      fn_args = Enum.map(1..arg_count, &(Macro.var (:"arg#{&1}"), nil))
      quote do
        def unquote(method)(unquote_splicing(fn_args)) do
          apply(unquote(module), unquote(method), [unquote_splicing(fn_args)])
        end
      end
    end

  end
end
