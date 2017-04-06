defmodule ParallelFake do
  
  def pmap(coleccion, funcion) do
    mi_pid = self()

    coleccion
      |> Enum.map(fn x ->
        spawn(fn ->
          # # :rand.seed(:os.timestamp)
          # segs = :rand.uniform(2)
          # :timer.sleep(segs * 1000)
          # IO.puts (" #{x} : #{segs}")
          send(mi_pid, {self, funcion.(x)}) 
        end)
      end)
      |> Enum.map(fn pid -> 
        receive do
          {^pid, result} -> result
        end
      end)

  end
end