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

  defp to_rgb([]), do: []
  defp to_rgb([head | tail]) do
    [hexadecimal_to_color_value(head) | to_rgb(tail)]
  end

  def to_hexadecimal([]), do: ""
  def to_hexadecimal([head | tail]) do
    value = head * 255 |> round
    (:io_lib.format("~2.16.0B", [value]) |> to_string) <> to_hexadecimal(tail)
  end

  def mix(color, color), do: color
  def mix(color, color, _opacity), do: color
  def mix([base | base_tail], [color | color_tail], opacity \\ 1) do
    [(base + color * opacity) / 2 | mix(base_tail, color_tail, opacity)]
  end

  def lighten([], _), do: []
  def lighten([head | tail], amount) when amount > (1 - head) do
    [1 | lighten(tail, amount)]
  end
  def lighten([head | tail], amount), do: [head + amount | lighten(tail, amount)]

  def darken([], _), do: []
  def darken([head | tail], amount) when amount > head do
    [0 | darken(tail, amount)]
  end
  def darken([head | tail], amount), do: [head - amount | darken(tail, amount)]
end
