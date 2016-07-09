defmodule ColorTest do
  use ExUnit.Case
  doctest Color

  test "returns the red value for a color" do
    assert Color.red("000000") == 0
    assert Color.red("FF0000") == 1
    assert Color.red("0F0000") == 0.058823529411764705
  end
end
