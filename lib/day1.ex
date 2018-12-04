defmodule Day1 do
  def part_one(input \\ getInput()) do
    input
    |> parse_integers()
    |> Enum.sum()
  end

  def part_two(input \\ getInput()) do
    input
    |> parse_integers()
    |> Stream.cycle()
    |> Enum.reduce_while([0], &find_repeating_sum/2)
  end

  defp getInput() do
    File.stream!("day1.txt")
    |> Enum.join(" ")
  end

  defp parse_integers(input) do
    Regex.split(~r{[\n\r\s]+}, input)
    |> Stream.filter(fn x -> x != "" end)
    |> Stream.map(&String.to_integer/1)
  end

  defp find_repeating_sum(x, acc) do
    sum = x + List.first(acc)
    if !hasCycled(sum, acc), do: {:cont, [sum | acc]}, else: {:halt, sum}
  end

  defp hasCycled(sum, acc) do
    # IO.puts(" #{x} -------  #{List.first(acc)}")
    Enum.member?(acc, sum)
  end
end
