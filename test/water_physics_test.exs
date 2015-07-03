defmodule WaterPhysicsTest do
  use ExUnit.Case

	test "flows into closest available space" do
		assert RockBottom.parse(['####',
														 '#~ #',
														 '#  #',
														 '####']) |> WaterPhysics.flow == {1, 2}

		assert RockBottom.parse(['####',
													   '#~ #',
					 								   '#~ #',
														 '####']) |> WaterPhysics.flow == {2, 2}
	end
end
