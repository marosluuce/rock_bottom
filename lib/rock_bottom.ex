defmodule RockBottom do

  def parse_water(world) do
    parse(world, ?~)
  end

  def parse_rock(world) do
    parse(world, ?#)
  end

  def parse_space(world) do
    parse(world, ?\s)
  end

  def parse_world(world) do
    [
      water: parse_water(world),
      space: parse_space(world),
      rock:  parse_rock(world)
    ]
  end

  defp parse(world, type) do
    world
    |> List.flatten
    |> Enum.with_index
    |> Enum.reduce([], fn ({block, n}, acc) when block == type -> [to_coordinates(n, world) | acc]
                          (_, acc)       -> acc end)
  end

  defp to_coordinates(index, world) do
    width = world |> List.first |> Enum.count
    {rem(index, width), div(index, width)}
  end
end
