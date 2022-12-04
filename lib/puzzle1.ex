defmodule Puzzle1 do
  def part1(input) do
    sums(input)
    |> Enum.max()
  end

  def part2(input) do
    sums(input)
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum()
  end

  defp sums(input) do
    for chunk <- Enum.chunk_by(input, &(&1 == "")), chunk != [""] do
      Enum.map(chunk, &String.to_integer/1)
      |> Enum.sum()
    end
  end
end
