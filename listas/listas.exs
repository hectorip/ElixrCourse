# hal = ["Carlos", "Eliel", "Fernando", "Héctor","Julián", "Jorge"]
defmodule Listas do
  # suma(lista) = lista[0] + suma(tail(lista))
  def suma([]), do: 0
  def suma([head|tail]), do: head+suma(tail)

end



