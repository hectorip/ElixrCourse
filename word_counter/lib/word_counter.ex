defmodule WordCounter do
  @moduledoc """
  Documentation for WordCounter.
  """

  @doc """
  Hello world.

  ## Examples

      iex> WordCounter.hello
      :world

  """
  def hello do
    :world
  end

  def count_words_in_string(frase) do
    frase
      |> String.replace(~r/ +/, " ")
      |> String.split(" ")
      |> length
  end

end
