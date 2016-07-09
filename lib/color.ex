defmodule Color do
  def red(color) do
    [red, _, _] = Regex.scan(~r/../, color) |> List.flatten
    {base, _} = red |> Integer.parse(16)
    base / 255
  end

  def green(color) do
    [_, green, _ ] = Regex.scan(~r/../, color) |> List.flatten
    {base, _} = green |> Integer.parse(16)
    base / 255
  end

  def blue(color) do
    [_, _, blue] = Regex.scan(~r/../, color) |> List.flatten
    {base, _} = blue |> Integer.parse(16)
    base / 255
  end

  def from_hexadecimal(hexadecimal) do
    Regex.scan(~r/../, hexadecimal) 
    |> List.flatten
    |> Enum.map(fn(value) -> 
     {base, _} = value |> Integer.parse(16)
     base / 255
    end)
  end
end
