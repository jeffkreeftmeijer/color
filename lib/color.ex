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
end
