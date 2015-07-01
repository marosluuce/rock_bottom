defmodule WaterPhysicsTest do
  use ExUnit.Case

  test "flows to the right" do
    world = RockBottom.parse(['###',
                              '~ #',
                              '###'])
   assert WaterPhysics.flow_right(world, {0,1}) |> RockBottom.render == ['###','~~#', '###']
  end

  test "flows dow" do
    world = RockBottom.parse(['###',
                              '~##',
                              ' ##'])
   assert WaterPhysics.flow_down(world, {0,1}) |> RockBottom.render == ['###','~##', '~##']
  end
end
