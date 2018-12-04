defmodule Day2 do
  def part_one(input \\ nil) do
    input
    |> parse
    |> Enum.map(&count_pairs/1)
    # |> Enum.reduce({0,0}, &sum_counts/2)
  end

  def count_pairs(line) do
    count_map =
      line
      |> String.to_char_list()
      |> Enum.reduce(%{}, &count_letters/2)

    Enum.reduce(Map.keys(count_map), {count_map, 0, 0}, &count_eligible/2)
    |> unpack
  end

  defp parse(string) when string == nil do
    File.stream!("day2.txt")
  end

  defp parse(string) do
    String.split(string, "\n")
  end

  defp getInput() do
    File.stream!("day2.txt")
  end

  defp count_letters(x, acc) do
    Map.update(acc, x, 1, &(&1 + 1))
  end

  defp count_eligible(x, acc) do
    {count_map, pair_count, triple_count} = acc

    pair_count =
      case Map.get(count_map, x) do
        2 -> 1 + pair_count
        _ -> pair_count
      end

    triple_count =
      case Map.get(count_map, x) do
        3 -> 1 + triple_count
        _ -> triple_count
      end

    # IO.puts(" #{inspect(Map.get(count_map, x))} #{inspect(pair_count)} #{inspect(triple_count)}")
    {count_map, pair_count, triple_count}
  end

  defp unpack(tuple) do
    {count_map, pair_count, triple_count} = tuple
    {pair_count, triple_count}
  end

defp sum_counts(x, acc) do
  {pair_count, triple_count} = x
  {pair_total, triple_total} = acc

  {pair_count + pair_total, triple_count + triple_total}
end

end
