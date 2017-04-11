defmodule Supervised do
  def independent do
    # spawn -> levanta proceso, recibe pid
    spawn(__MODULE__, :test, [:true])
    "Terminé bien"
  end

  def supervised do
    spawn_link(__MODULE__, :test, [:true])
    "Terminé bien"
  end

  def monitor do
    spawn_monitor(__MODULE__, :test, [:true])
    receive do
      msg -> "Recibí un mensaje: #{inspect msg}"
    after 
      2000 -> "No ha paasado nada, me muero"
    end
  end

  def test(:true) do
    :timer.sleep(1000)
    raise "Este proceso falló"
  end

  def test(_), do: "todo bien"

end
