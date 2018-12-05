defmodule Day2 do
  def part_one(input \\ nil) do
    input
    |> parse
    |> Enum.map(&count_pairs/1)
    |> Enum.reduce({0, 0}, &sum_counts/2)
    |> sum
  end

  def count_pairs(line) do
    count_map =
      line
      |> String.to_char_list()
      |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)

    Enum.reduce(Map.keys(count_map), {count_map, 0, 0}, &count_eligible/2)
    |> unpack
  end

  defp parse(string) when string == nil do
    File.stream!("day2.txt")
  end

  defp parse(string) do
    String.split(string, "\n")
  end

  defp count_eligible(x, {count_map, pair_exists, triple_exists}) do
    pair_exists =
      case Map.get(count_map, x) do
        2 -> 1
        _ -> pair_exists
      end

      triple_exists =
      case Map.get(count_map, x) do
        3 -> 1
        _ -> triple_exists
      end

    # IO.puts(" #{inspect(Map.get(count_map, x))} #{inspect(pair_exists)} #{inspect(triple_exists)}")
    {count_map, pair_exists, triple_exists}
  end

  defp unpack({count_map, pair_count, triple_count}) do
    {pair_count, triple_count}
  end

  defp sum_counts({pair_count, triple_count}, {pair_total, triple_total}) do
    {pair_count + pair_total, triple_count + triple_total}
  end

  defp sum({pair_count, triple_count}) do
    pair_count * triple_count
  end
end
