defmodule Puzzle2Test do
  use ExUnit.Case

  test "part 1 with example input" do
    assert Puzzle2.part1(Input.lines("input/day2_ex.txt")) == 15
  end

  test "part 1 with real input" do
    assert Puzzle2.part1(Input.lines("input/day2.txt")) == 9177
  end

  test "part 2 with example input" do
    assert Puzzle2.part2(Input.lines("input/day2_ex.txt")) == 12
  end

  test "part 2 with real input" do
    assert Puzzle2.part2(Input.lines("input/day2.txt")) == 12111
  end
end
