defmodule Rec do

  # Fórmula
  # x! = x * (x-1) * (x-2) ... 1
  # x! = x * (x-1)!
  # 0! = 1
  # 1! = 1
  # Las funciones pueden usar pattern matching para decidir si son ejecutadas o no 
  def factorial(0), do: 1

  def factorial(1), do: 1

  def factorial(x) do
    x * factorial(x-1) # tail recursion
  end

  # Las funciones pueden tener condiciones para ejecutarse
  # En elixir se conocen como "Guards"
  def fizz_buzz(n) when rem(n, 15) == 0 and n > 0 do # Guards
    IO.puts("FizzBuzz")
    fizz_buzz(n+1)
  end

  def fizz_buzz(n) when rem(n, 3) == 0 and n > 0 do
    IO.puts("Fizz")
    fizz_buzz(n+1)
  end

  def fizz_buzz(n) when rem(n, 5) == 0 and n > 0 do
    IO.puts("Buzz")
    fizz_buzz(n+1)
  end

  def fizz_buzz(n) when n <= 100 do
    IO.puts(n)
    fizz_buzz(n+1)
  end

  def fizz_buzz(_n), do: :ok

  def fizz_buzz_map(limit) do
    1..limit
    |> Enum.map(fn x ->
      cond do
        rem(x, 15) == 0 -> "FizzBuzz"
        rem(x, 3) == 0 -> "Fizz"
        rem(x, 5) == 0 -> "Buzz"
        true -> x
      end
      # IO.puts imp
    end)
  end

end