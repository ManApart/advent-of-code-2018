defmodule Day1 do
  def part_one(input) do
    Regex.split(~r{[\n\r\s]+}, input)
    |> Enum.map(fn x-> String.replace_prefix(x, "+", "") end)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x-> String.to_integer(x) end)
    |> Enum.sum
  end
end
