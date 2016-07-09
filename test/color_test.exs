defmodule ColorTest do
  use ExUnit.Case
  doctest Color

  test "returns the red value for a color" do
    assert Color.red("000000") == 0
    assert Color.red("FF0000") == 1
    assert Color.red("0F0000") == 0.058823529411764705
  end

  test "returns the green value for a color" do
    assert Color.green("000000") == 0
    assert Color.green("00FF00") == 1
    assert Color.green("000F00") == 0.058823529411764705
  end

  test "returns the blue value for a color" do
    assert Color.blue("000000") == 0
    assert Color.blue("0000FF") == 1
    assert Color.blue("00000F") == 0.058823529411764705
  end

  test "converts a hexidecimal string to a list of RGB values" do
    assert Color.from_hexadecimal("000000") == [0,0,0]
    assert Color.from_hexadecimal("FFFFFF") == [1,1,1]
    assert Color.from_hexadecimal("0F0F0F") == [0.058823529411764705, 0.058823529411764705, 0.058823529411764705]
  end
end
