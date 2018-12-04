defmodule Day2Tests do
  use ExUnit.Case

  test "part one" do
    input = """
    abcdef
    bababc
    abbcde
    abcccd
    aabcdd
    abcdee
    ababab
    """
    assert Day2.part_one(input) == 12
  end

  test "part one no letters" do
    line = "abcdef"
    assert Day2.count_pairs(line) == {0, 0}
  end

  test "part one - bababc" do
    line = "bababc"
    assert Day2.count_pairs(line) == {1, 1}
  end

  test "part one abbcde" do
    line = "abbcde"
    assert Day2.count_pairs(line) == {1, 0}
  end

  test "part one abcccd" do
    line = "abcccd"
    assert Day2.count_pairs(line) == {0, 1}
  end

  test "part one aabcdd" do
    line = "aabcdd"
    assert Day2.count_pairs(line) == {1, 0}
  end
end
