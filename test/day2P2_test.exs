defmodule Day2P2Tests do
  use ExUnit.Case


  test "part two" do
    input = """
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
    """

    assert Day2P2.part_two(input) == "fgij"
  end


  test "part two - words match 0" do
    assert Day2P2.word_matches("fghij", "abcde") == false
  end

  test "part two - words match 4" do
    assert Day2P2.word_matches("fghij", "fguij") == true
  end

end
