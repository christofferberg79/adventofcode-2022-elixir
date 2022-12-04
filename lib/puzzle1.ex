defmodule Puzzle1 do
  def part1(input) do
    sums(input)
    |> Enum.max()
  end

  def part2(input) do
    sums(input)
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp sums(input) do
    input
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(&Enum.map(&1, fn s -> String.to_integer(s) end))
    |> Enum.map(&Enum.sum/1)
  end
end
