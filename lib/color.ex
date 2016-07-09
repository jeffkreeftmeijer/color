defmodule Color do
  def red(color) do
    [red | _ ] = Regex.scan(~r/../, color) |> List.flatten
    {base, _} = red |> Integer.parse(16)
    base / 255
  end
end
