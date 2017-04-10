defmodule ParallelFake do

  def pmap(coleccion, funcion) do
    mi_pid = self() # obteniendo pid del proceso actual
    coleccion
      |> Enum.map(fn x ->
        spawn(fn ->  
          random_wait()
          send(mi_pid, {self(), funcion.(x)})
        end)
      end) # devuelve un mapa con la lista de PID's
      |> Enum.map(fn pid ->
        IO.puts "#{inspect(pid)}: Running"
        receive do
          {^pid, result} -> 
            IO.puts "#{inspect(pid)}: Received"
            result # ^ es llamado "pin operator", evita que una variable se reasigne en un pettern match
        end
      end) # devuelve la lista de valores calculados, en orden
  end

  def random_wait() do
    segs = :rand.uniform(2)
    :timer.sleep(segs * 1000)
  end
end