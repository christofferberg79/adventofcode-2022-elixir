defmodule Puzzle4 do
  def part1(input) do
    parse(input)
    |> Enum.count(&has_full_overlap/1)
  end

  def part2(input) do
    parse(input)
    |> Enum.count(&has_some_overlap/1)
  end

  defp parse(input) do
    input
    |> Enum.map(fn line ->
      String.split(line, ~r/[,-]/)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp has_full_overlap([x1, x2, y1, y2]) do
    x1 <= y1 and x2 >= y2 or y1 <= x1 and y2 >= x2
  end

  defp has_some_overlap([x1, x2, y1, y2]) do
    x1 <= y2 and x2 >= y1
  end
end
