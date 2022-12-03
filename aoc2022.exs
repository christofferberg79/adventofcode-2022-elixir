defmodule Input do
  def lines(path) do
    File.read!(path)
    |> String.split("\r\n")
    |> Enum.reverse()
    |> Enum.drop_while(&(&1 == ""))
    |> Enum.reverse()
  end
end

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
      Enum.find(String.codepoints(s1), fn c ->
        String.contains?(s2, c) and String.contains?(s3, c)
      end)
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

defmodule AoC2022 do
  def run(path, fun) do
    Input.lines(path) |> fun.() |> IO.puts()
  end

  def run do
    # 72478
    run("input/day1.txt", &Puzzle1.part1/1)
    # 210367
    run("input/day1.txt", &Puzzle1.part2/1)
    # 9177
    run("input/day2.txt", &Puzzle2.part1/1)
    # 12111
    run("input/day2.txt", &Puzzle2.part2/1)
    # 7997
    run("input/day3.txt", &Puzzle3.part1/1)
    # 2545
    run("input/day3.txt", &Puzzle3.part2/1)
  end
end

AoC2022.run()
