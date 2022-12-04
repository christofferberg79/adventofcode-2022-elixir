defmodule Puzzle3 do
  def part1(input) do
    input
    |> Enum.map(&String.split_at(&1, div(String.length(&1), 2)))
    |> Enum.map(fn {s1, s2} ->
      Enum.find(String.codepoints(s1), fn c -> String.contains?(s2, c) end)
    end)
    |> Enum.map(&prio/1)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Enum.chunk_every(3)
    |> Enum.map(fn [s1, s2, s3] ->
      Enum.find(String.codepoints(s1), fn c -> String.contains?(s2, c) and String.contains?(s3, c) end)
    end)
    |> Enum.map(&prio/1)
    |> Enum.sum()
  end

  defp prio(s) do
    i = String.to_charlist(s) |> Enum.at(0)

    cond do
      i in ?a..?z -> i - ?a + 1
      i in ?A..?Z -> i - ?A + 27
    end
  end
end
