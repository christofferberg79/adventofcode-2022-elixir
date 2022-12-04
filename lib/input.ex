defmodule Input do
  def lines(path) do
    File.stream!(path)
    |> Enum.map(&String.trim/1)
  end
end
