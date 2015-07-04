defmodule WaterPhysicsTest do
  use ExUnit.Case

	test "flow into closest available space" do
		assert RockBottom.parse(['####',
														 '#~ #',
														 '#  #',
														 '####']) |> WaterPhysics.flow_into == {1, 2}

		assert RockBottom.parse(['####',
													   '#~ #',
					 								   '#~ #',
														 '####']) |> WaterPhysics.flow_into == {2, 2}
	end

	test "flow from world to world" do
		world = ['####',
		         '#~ #',
		         '#  #',
		         '####']
		|> RockBottom.parse
		|> WaterPhysics.flow
		|> RockBottom.render

		assert world == ['####',
										 '#~ #',
										 '#~ #',
										 '####']
	end
end
