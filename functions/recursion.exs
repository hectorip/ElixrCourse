defmodule Rec do

  # Fórmula
  # x! = x * (x-1) * (x-2) ... 1
  # x! = x * (x-1)!
  # 0! = 1
  # 1! = 1

  def factorial(0), do: 1

  def factorial(1), do: 1

  def factorial(x) do
    x * factorial(x-1) # tail recursion
  end

end