# Este módulo es de prueba
defmodule Statistics do

  # función = nombre + arity
  def average([]) do
    {:error, "No se puede calcular promedio de una lista vacía"}
  end

  def average(vals) do
    suma = vals
            |> Enum.reduce(0, fn acc, x -> acc + x end)
    # suma = Enum.reduce(vals, 0, fn acc, x -> acc + x end)
    {:ok, suma / length(vals)}
  end
  
end