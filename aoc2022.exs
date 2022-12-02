defmodule Aoc2022 do
    defp puzzle1_part1 do
        File.read!("input/day1.txt")
        |> String.split("\r\n")
        |> Enum.chunk_by(&(&1 == ""))
        |> Enum.filter(&(&1 != [""]))
        |> Enum.map(&(Enum.map(&1, fn(s) -> String.to_integer(s) end)))
        |> Enum.map(&Enum.sum/1)
        |> Enum.max()
    end

    defp puzzle1_part2 do
        File.read!("input/day1.txt")
        |> String.split("\r\n")
        |> Enum.chunk_by(&(&1 == ""))
        |> Enum.filter(&(&1 != [""]))
        |> Enum.map(&(Enum.map(&1, fn(s) -> String.to_integer(s) end)))
        |> Enum.map(&Enum.sum/1)
        |> Enum.sort()
        |> Enum.reverse()
        |> Enum.take(3)
        |> Enum.sum()
    end

    def run do
        IO.puts(puzzle1_part1())
        IO.puts(puzzle1_part2())
    end
end

Aoc2022.run()