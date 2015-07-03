defmodule WaterPhysics do

	def flow(world) do
		case flowable_down(world) do
			[cell] -> cell
			other  -> world
								|> flowable_right
								|> Enum.max_by(fn ({_, y}) -> y end)
		end
  end

	defp flowing([water: water, space: space, rock: _], flow_direction) do
		water
		|> Enum.map(flow_direction)
		|> Enum.filter(fn (el) -> Enum.member?(space, el) end)
	end

	defp flowable_right(world) do
		flowing(world, fn ({x, y}) -> {x + 1, y} end)
	end

	defp flowable_down(world) do
		flowing(world, fn ({x, y}) -> {x, y + 1} end)
	end
end
