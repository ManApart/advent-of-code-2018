defmodule Day2P2 do
  def part_two(input \\ nil) do
    lines = input
    |> parse
    
    Enum.reduce_while(lines, lines, &find_word_pair/2)
    |> remove_unmatched_letter
  end

  defp parse(string) when string == nil do
    File.stream!("day2.txt")
  end

  defp parse(string) do
    String.split(string, "\n")
  end

  defp find_word_pair(search_word, all_words) do
    # other_words = List.delete(all_words, search_word)
    IO.puts("find_word_pair: " <> search_word <> " " <> inspect(all_words))
    possible_match = Enum.reduce_while(all_words, search_word, &test_word_pair/2)
    if possible_match == search_word, do: {:cont, all_words}, else: {:halt, {search_word, possible_match}}
  end

  defp test_word_pair(possible_match, original_word) do
    # IO.puts("test_word_pair: " <> possible_match <> " " <> original_word)
    if possible_match == original_word, do: {:cont, original_word}
    if !word_matches(possible_match, original_word), do: {:cont, original_word}, else: {:halt, {possible_match, original_word}}
  end

  def word_matches(word_a, word_b) do
      {i, match_count, other_word} = Enum.reduce(String.to_char_list(word_a), {0, 0, String.to_char_list(word_b)}, &letter_matches/2)
      IO.puts("letter count: " <> inspect(word_a) <> " " <> inspect(word_b) <> " " <> inspect(match_count))
      (String.length(word_a)-match_count == 1)
  end

  defp letter_matches(letter, {i, count, other_word}) do
    other_letter = Enum.at(other_word, i)
    matches = cond do
      letter == other_letter -> 1
      true -> 0
    end
    # IO.puts("Letter: " <> inspect(letter) <> " " <> inspect(i) <> " " <> inspect(other_letter) <> " " <> inspect(matches))
    {1+i, count + matches, other_word}
  end

  defp remove_unmatched_letter({_, {word_a, word_b}}) do
    # Enum.reduce_while(String.to_char_list(word_a), String.to_char_list(word_b), &find_word_pair/2)
    {word_a, word_b}
  end

end
