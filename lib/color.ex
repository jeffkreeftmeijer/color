defmodule Color do
  def red([red, _, _]), do: red
  def green([_, green, _]), do: green
  def blue([_, _, blue]), do: blue

  def from_hexadecimal(hexadecimal) do
    hexadecimal
    |> split_hexadecimal
    |> to_rgb
  end

  defp split_hexadecimal(hexadecimal) do
    Regex.scan(~r/../, hexadecimal) 
    |> List.flatten
  end

  defp hexadecimal_to_color_value(hexadecimal) do
    {base, _} =  hexadecimal |> Integer.parse(16)
    base / 255
  end

  defp to_rgb(value) do
    value
    |> Enum.map(&hexadecimal_to_color_value/1)
  end

  def to_hexadecimal([]), do: ""
  def to_hexadecimal([head | tail]) do
    value = head * 255 |> round
    (:io_lib.format("~2.16.0B", [value]) |> to_string) <> to_hexadecimal(tail)
  end

  def lighten([], _), do: []
  def lighten([head | tail], amount), do: [head + amount | lighten(tail, amount)]

  def darken([], _), do: []
  def darken([head | tail], amount), do: [head - amount | darken(tail, amount)]
end
