defmodule RockBottomTest do
  use ExUnit.Case

  test "parses water" do
    assert RockBottom.parse_water(['~~']) |> Enum.sort == [{0, 0}, {1, 0}] |> Enum.sort
  end

  test "parses only water" do
    assert RockBottom.parse_water(['# ~ #']) == [{2, 0}]
  end

  test "parses rock" do
    assert RockBottom.parse_rock(['#', '#']) |> Enum.sort == [{0, 0}, {0, 1}] |> Enum.sort
  end

  test "parses only rock" do
    assert RockBottom.parse_rock([' #~']) == [{1, 0}]
  end

  test "parses empty space" do
    assert RockBottom.parse_space(['  ']) |> Enum.sort == [{0, 0}, {1, 0}] |> Enum.sort
  end

  test "parses only empty space" do
    assert RockBottom.parse_space(['# ~']) == [{1, 0}]
  end

  test "parse the world" do
    world = ['###',
             '~ #',
             '###']

    parsed_world = RockBottom.parse_world(world)

    assert parsed_world[:water] == [{0, 1}]
    assert parsed_world[:space] == [{1, 1}]
    assert parsed_world[:rock] |> Enum.sort == [{0, 0}, {1, 0}, {2, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}] |> Enum.sort
  end
end
