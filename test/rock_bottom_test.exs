defmodule RockBottomTest do
  use ExUnit.Case

  test "parse the world" do
    world = ['###',
             '~ #',
             '###']

    parsed_world = RockBottom.parse(world)

    assert parsed_world[:water] == [{0, 1}]
    assert parsed_world[:space] == [{1, 1}]
    assert parsed_world[:rock] |> Enum.sort == [{0, 0}, {1, 0}, {2, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}] |> Enum.sort
  end

  test "renders the world" do
    world = [water: [{0, 0}, {1, 1}],
             rock:  [{1, 0}],
             space: [{0, 1}]]

    assert RockBottom.render(world) == ['~#',
                                        ' ~']
  end

  test "parses and renders the world" do
    world = ['###',
             '~ #',
             '###']

    assert world
           |> RockBottom.parse
           |> RockBottom.render == world
  end
end
