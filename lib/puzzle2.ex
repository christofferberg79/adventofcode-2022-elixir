defmodule Puzzle2 do
  def part1(input) do
    parse(input)
    |> Enum.map(fn
      [s2, s2] -> s2 + 3
      [s1, s2] when s2 == rem(s1, 3) + 1 -> s2 + 6
      [_s1, s2] -> s2
    end)
    |> Enum.sum()
  end

  def part2(input) do
    parse(input)
    |> Enum.map(fn
      [s1, 1] -> rem(s1 + 1, 3) + 1
      [s1, 2] -> 3 + s1
      [s1, 3] -> 6 + rem(s1, 3) + 1
    end)
    |> Enum.sum()
  end

  defp parse(input) do
    input
    |> Enum.map(fn round ->
      String.split(round, " ")
      |> Enum.map(fn
        "A" -> 1
        "B" -> 2
        "C" -> 3
        "X" -> 1
        "Y" -> 2
        "Z" -> 3
      end)
    end)
  end
end
