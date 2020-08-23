defmodule FizzBuzz do
  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """
  Build.

  ## Examples

      iex> FizzBuzz.build("numbers.txt")
      "1,2,3,4,5,10,20"

  """
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(&convert_numbers/1)
  end

  defp handle_file({:error, reason}), do: "Error read file: #{reason}"

  defp convert_numbers(element) do
    number = String.to_integer(element)
    evaluate_numbers(number)
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
