defmodule Day1 do
  def part_one(input) do
    Regex.split(~r{[\n\r\s]+}, input)
    |> Enum.map(fn x-> String.replace_prefix(x, "+", "") end)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x-> String.to_integer(x) end)
    |> Enum.sum
  end

  def part_two(input) do
    Regex.split(~r{[\n\r\s]+}, input)
    |> Enum.map(fn x-> String.replace_prefix(x, "+", "") end)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x-> String.to_integer(x) end)
    |> Stream.cycle
    |> Enum.reduce_while([0], fn x, acc ->
        if !hasCycled(x, acc), do: {:cont, [(x + List.first(acc)) | acc]}, else: {:halt, x + List.first(acc)}
    end)
  end

  defp hasCycled(x, acc) do
    # IO.puts(" #{x} -------  #{List.first(acc)}")
    Enum.member?(acc, x + List.first(acc))
  end

end
