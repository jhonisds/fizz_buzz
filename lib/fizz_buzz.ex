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
  end

  defp handle_file({:error, reason}), do: reason
end
