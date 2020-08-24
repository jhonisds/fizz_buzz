defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}
      assert expected_response == FizzBuzz.build("numbers.txt")
    end

    test "when a invalid file is provided, returns the converted list" do
      expected_response = {:error, "Error read file: enoent"}
      assert expected_response == FizzBuzz.build("invalid.txt")
    end
  end
end
