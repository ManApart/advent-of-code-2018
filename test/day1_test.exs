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
end
