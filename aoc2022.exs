defmodule Aoc2022 do
    defp lines(path) do
        File.read!(path)
        |> String.split("\r\n")
        |> Enum.reverse()
        |> Enum.drop_while(&(&1 == ""))
        |> Enum.reverse()
    end

    defp puzzle1_part1(input) do
        input
        |> Enum.chunk_by(&(&1 == ""))
        |> Enum.filter(&(&1 != [""]))
        |> Enum.map(&(Enum.map(&1, fn(s) -> String.to_integer(s) end)))
        |> Enum.map(&Enum.sum/1)
        |> Enum.max()
    end

    defp puzzle1_part2(input) do
        input
        |> Enum.chunk_by(&(&1 == ""))
        |> Enum.filter(&(&1 != [""]))
        |> Enum.map(&(Enum.map(&1, fn(s) -> String.to_integer(s) end)))
        |> Enum.map(&Enum.sum/1)
        |> Enum.sort()
        |> Enum.reverse()
        |> Enum.take(3)
        |> Enum.sum()
    end

    defp puzzle2_part1(input) do
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
            |> fn 
                [s2, s2] -> s2 + 3
                [s1, s2] when s2 == rem(s1, 3) + 1 -> s2 + 6
                [_s1, s2] -> s2
            end.()
        end)
        |> Enum.sum()
    end

    def run(path, fun) do
        lines(path) |> fun.() |> IO.puts
    end

    def run do
        run("input/day1.txt", &puzzle1_part1/1) # 72478
        run("input/day1.txt", &puzzle1_part2/1) # 210367
        run("input/day2.txt", &puzzle2_part1/1) # 9177
    end
end

Aoc2022.run()