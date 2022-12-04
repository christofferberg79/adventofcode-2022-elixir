defmodule Puzzle1Test do
  use ExUnit.Case

  test "part 1 with example input" do
    assert Puzzle1.part1(Input.lines("input/day1_ex.txt")) == 24000
  end

  test "part 1 with real input" do
    assert Puzzle1.part1(Input.lines("input/day1.txt")) == 72478
  end

  test "part 2 with example input" do
    assert Puzzle1.part2(Input.lines("input/day1_ex.txt")) == 45000
  end

  test "part 2 with real input" do
    assert Puzzle1.part2(Input.lines("input/day1.txt")) == 210367
  end
end
