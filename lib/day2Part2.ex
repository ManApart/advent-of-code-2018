defmodule Day2Part2 do
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
    string
    |> String.trim
    |> String.split("\n")
  end

  defp find_word_pair(search_word, all_words) do
    word_search = Enum.reduce_while(all_words, search_word, &test_word_pair/2)
    case word_search do
      {match, un_matched_indexes} -> {:halt, {match, un_matched_indexes} }
      _ -> {:cont, all_words}
    end

  end

  defp test_word_pair(possible_match, original_word) when possible_match == original_word, do: {:cont, original_word}

  defp test_word_pair(possible_match, original_word) do
    un_matched_indexes = find_un_matched_indexes(possible_match, original_word)
    if length(un_matched_indexes) == 1, do: {:halt, {possible_match, un_matched_indexes}}, else: {:cont, original_word}
  end

  def find_un_matched_indexes(word_a, word_b) do
      {_, un_matched_indexes, _} = Enum.reduce(String.to_charlist(word_a), {0, [], String.to_charlist(word_b)}, &letter_matches/2)
      un_matched_indexes
  end

  defp letter_matches(letter, {i, un_matched_indexes, other_word}) do
    other_letter = Enum.at(other_word, i)
    new_un_matched_indexes = cond do
      letter == other_letter -> un_matched_indexes
      true -> [i | un_matched_indexes]
    end
    {1+i, new_un_matched_indexes, other_word}
  end

  defp remove_unmatched_letter({original_word, un_matched_indexes}) do
    original_word
    |> String.to_charlist
    |> List.delete_at( List.first(un_matched_indexes))
    |> List.to_string
  end

end
