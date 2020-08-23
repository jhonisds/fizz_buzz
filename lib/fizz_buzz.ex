defmodule FizzBuzz do
  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """
  Build.

  ## Examples

      iex> FizzBuzz.build("numbers.txt")
      {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}

      iex> FizzBuzz.build("invalide.txt")
      {:error, "Error read file: enoent"}

  """
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_numbers/1)

    {:ok, result}
  end

  defp handle_file({:error, reason}), do: {:error, "Error read file: #{reason}"}

  defp convert_numbers(element) do
    element
    |> String.to_integer()
    |> evaluate_numbers
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
