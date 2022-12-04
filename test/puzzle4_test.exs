defmodule Puzzle4Test do
  use ExUnit.Case

  test "part 1 with example input" do
    assert Puzzle4.part1(Input.lines("input/day4_ex.txt")) == 2
  end

  test "part 1 with real input" do
    assert Puzzle4.part1(Input.lines("input/day4.txt")) == 466
  end

  test "part 2 with example input" do
    assert Puzzle4.part2(Input.lines("input/day4_ex.txt")) == 4
  end

  test "part 2 with real input" do
    assert Puzzle4.part2(Input.lines("input/day4.txt")) == 865
  end
end
