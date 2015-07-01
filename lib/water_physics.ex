defmodule WaterPhysics do
  def flow_right(world, {col, row}) do
    flow(world, {col+1, row})
  end

  def flow_down(world, {col, row}) do
    flow(world, {col, row+1})
  end

  defp flow(world, element) do
    world
     |> update_water(element)
     |> update_space(element)
  end

  defp update_water(world, element) do
    Keyword.update!(world, :water, fn(_) -> [element | world[:water]] end)
  end

  defp update_space(world, element) do
    Keyword.update!(world, :space, fn(_) -> List.delete(world[:space], element) end)
  end
end
