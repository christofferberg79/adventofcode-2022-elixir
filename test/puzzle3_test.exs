defmodule Puzzle3Test do
  use ExUnit.Case

  test "part 1 with example input" do
    assert Puzzle3.part1(Input.lines("input/day3_ex.txt")) == 157
  end

  test "part 1 with real input" do
    assert Puzzle3.part1(Input.lines("input/day3.txt")) == 7997
  end

  test "part 2 with example input" do
    assert Puzzle3.part2(Input.lines("input/day3_ex.txt")) == 70
  end

  test "part 2 with real input" do
    assert Puzzle3.part2(Input.lines("input/day3.txt")) == 2545
  end
end
