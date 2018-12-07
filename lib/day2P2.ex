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
    string
    |> String.trim
    |> String.split("\n")
  end

  defp find_word_pair(search_word, all_words) do
    # other_words = List.delete(all_words, search_word)
    # IO.puts("find_word_pair: " <> search_word <> " " <> inspect(all_words))
    word_search = Enum.reduce_while(all_words, search_word, &test_word_pair/2)
    # IO.puts("word search" <> inspect(word_search))
    case word_search do
      {match, un_matched_indexes} -> {:halt, {match, un_matched_indexes} }
      _ -> {:cont, all_words}
    end

  end

  defp test_word_pair(possible_match, original_word) do
    # IO.puts("test_word_pair: " <> possible_match <> " " <> original_word)
    if possible_match == original_word, do: {:cont, original_word}
    un_matched_indexes = find_un_matched_indexes(possible_match, original_word)
    # TODO - returning different arity in continue and halt
    if length(un_matched_indexes) != 1, do: {:cont, original_word}, else: {:halt, {possible_match, un_matched_indexes}}
  end

  def find_un_matched_indexes(word_a, word_b) do
      {i, un_matched_indexes, other_word} = Enum.reduce(String.to_char_list(word_a), {0, [], String.to_char_list(word_b)}, &letter_matches/2)
      # IO.puts("letter matches: " <> inspect(word_a) <> " " <> inspect(word_b) <> " " <> inspect(un_matched_indexes))
      un_matched_indexes
  end

  defp letter_matches(letter, {i, un_matched_indexes, other_word}) do
    other_letter = Enum.at(other_word, i)
    new_un_matched_indexes = cond do
      letter == other_letter -> un_matched_indexes
      true -> [i | un_matched_indexes]
    end
    # IO.puts("Letter: " <> inspect(letter) <> " " <> inspect(i) <> " " <> inspect(other_letter) <> " " <> inspect(new_un_matched_indexes))
    {1+i, new_un_matched_indexes, other_word}
  end

  defp remove_unmatched_letter({original_word, un_matched_indexes}) do
    # Enum.reduce_while(String.to_char_list(word_a), String.to_char_list(word_b), &find_word_pair/2)
    # {word_a, word_b}
    i = List.first(un_matched_indexes)

    original_word
    |> String.to_char_list
    |> List.delete_at(i)
    |> List.to_string
  end

end
