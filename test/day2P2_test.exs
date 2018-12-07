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
    assert [4,3,2,1, 0] == Day2P2.find_un_matched_indexes("fghij", "abcde")
  end

  test "part two - words match 4" do
    assert [2] == Day2P2.find_un_matched_indexes("fghij", "fguij")
  end

end
