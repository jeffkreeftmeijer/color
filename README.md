# Color

Converts hexadecimal color representations to RGB values.

## Installation

``` elixir
# mix.exs
def deps do
  [{:colorscheme, git: "git://github.com/jeffkreeftmeijer/color.git"}]
end
```

## Usage

``` elixir
Color.from_hexadecimal("F0AA03")                # => [0.9411764705882353, 0.6666666666666666, 0.011764705882352941]
Color.from_hexadecimal("F0AA03") |> Color.blue  # => 0.011764705882352941
```
