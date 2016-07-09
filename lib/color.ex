defmodule Color do
  def red([red, _, _]), do: red
  def green([_, green, _]), do: green
  def blue([_, _, blue]), do: blue

  def from_hexadecimal(hexadecimal) do
    Regex.scan(~r/../, hexadecimal) 
    |> List.flatten
    |> Enum.map(fn(value) -> 
     {base, _} = value |> Integer.parse(16)
     base / 255
    end)
  end

  def lighten(values, amount) do
    values |> Enum.map(&(&1 + amount))
  end

  def darken(values, amount) do
    values |> Enum.map(&(&1 - amount))
  end
end
