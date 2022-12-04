defmodule Input do
  def lines(path) do
    File.read!(path)
    |> String.split("\r\n")
    |> Enum.reverse()
    |> Enum.drop_while(&(&1 == ""))
    |> Enum.reverse()
  end
end
