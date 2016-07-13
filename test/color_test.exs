defmodule ColorTest do
  use ExUnit.Case
  doctest Color

  test "returns the red value for a color" do
    assert Color.red([0,1,1]) == 0
    assert Color.red([1,0,0]) == 1
    assert Color.red([0.058823529411764705, 0, 0]) == 0.058823529411764705
  end

  test "returns the green value for a color" do
    assert Color.green([1,0,1]) == 0
    assert Color.green([0,1,0]) == 1
    assert Color.green([0, 0.058823529411764705, 0]) == 0.058823529411764705
  end

  test "returns the blue value for a color" do
    assert Color.blue([1,1,0]) == 0
    assert Color.blue([0,0,1]) == 1
    assert Color.blue([0, 0, 0.058823529411764705]) == 0.058823529411764705
  end

  test "converts a hexidecimal string to a list of RGB values" do
    assert Color.from_hexadecimal("000000") == [0,0,0]
    assert Color.from_hexadecimal("FFFFFF") == [1,1,1]
    assert Color.from_hexadecimal("0F0F0F") == [0.058823529411764705, 0.058823529411764705, 0.058823529411764705]
  end

  test "converts a list of RGB colors to a hexidecimal string" do
    assert Color.to_hexadecimal([0,0,0]) == "000000"
    assert Color.to_hexadecimal([1,1,1]) == "FFFFFF"
    assert Color.to_hexadecimal([0.058823529411764705, 0.058823529411764705, 0.058823529411764705]) == "0F0F0F"
  end

  test "mixes two colors" do
    assert [0,0,0] |> Color.mix([0,0,0]) == [0,0,0]
    assert [0,0,0] |> Color.mix([1,1,1]) == [0.5, 0.5, 0.5]
  end

  test "lightens a color" do
    assert [0,0,0] |> Color.lighten(0) == [0,0,0]
    assert [0,0,0] |> Color.lighten(1) == [1,1,1]
    assert [0,0,0] |> Color.lighten(0.5) == [0.5,0.5,0.5]
  end

  test "darkens a color" do
    assert [1,1,1] |> Color.darken(0) == [1,1,1]
    assert [1,1,1] |> Color.darken(1) == [0,0,0]
    assert [1,1,1] |> Color.darken(0.5) == [0.5,0.5,0.5]
  end
end
