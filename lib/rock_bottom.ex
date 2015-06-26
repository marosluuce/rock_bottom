defmodule RockBottom do
  @cells [water: ?~,
          rock:  ?#,
          space: ?\s]

  def render(world) do
    world
    |> normalize
    |> to_ascii
  end

  def normalize(world) do
    Enum.flat_map(world, &invert/1)
  end

  defp invert({type, locations}) do
    Enum.zip(locations, repeat(type))
  end

  defp to_ascii(world) do
    world
    |> Enum.group_by(&y_coordinate/1)
    |> Map.values
    |> Enum.map(&map_row/1)
  end

  defp repeat(value), do: Stream.repeatedly(fn -> value end)

  defp y_coordinate({{_, y}, _}), do: y

  defp map_row(row) do
    row
    |> Enum.sort
    |> Enum.map(&to_cell/1)
  end

  defp to_cell({_, type}), do: @cells[type]

  def parse(world) do
    [
      water: parse_water(world),
      space: parse_space(world),
      rock:  parse_rock(world)
    ]
  end

  defp parse_water(world) do
    parse(world, @cells[:water])
  end

  defp parse_rock(world) do
    parse(world, @cells[:rock])
  end

  defp parse_space(world) do
    parse(world, @cells[:space])
  end

  defp parse(world, type) do
    world
    |> List.flatten
    |> Enum.with_index
    |> Enum.reduce([], fn ({block, n}, acc) when block == type -> [to_coordinates(n, world) | acc]
                          (_, acc)       -> acc end)
  end

  defp to_coordinates(index, world) do
    width = width_of(world)
    {rem(index, width), div(index, width)}
  end

  defp width_of(world) do
     world
     |> List.first
     |> Enum.count
  end
end
