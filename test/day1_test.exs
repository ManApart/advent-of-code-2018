defmodule Day1Tests do
  use ExUnit.Case

  test "part one" do
    input = """
    -5
    -2
    +1
    +14
    """

    assert Day1.part_one(input) == 8
  end

  test "part one same line" do
    input = "-5 -2 +1 +14"

    assert Day1.part_one(input) == 8
  end

  test "part two 10" do
    input = "+3 +3 +4 -2 -4"

    assert Day1.part_two(input) == 10
  end

  test "part two 5" do
    input = "-6 +3 +8 +5 -6"

    assert Day1.part_two(input) == 5
  end

  test "part two 14" do
    input = "+7 +7 -2 -7 -4"

    assert Day1.part_two(input) == 14
  end
end
