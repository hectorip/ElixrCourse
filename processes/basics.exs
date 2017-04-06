defmodule BasicProcesses do
  
  def creating_processes do

    pid = spawn(__MODULE__, :echo_process, []) # levanta el proceso de la función especifcada
    opid = spawn(OtrosProcesos, :otro_echo, []) # levanta el proceso de la función especifcada

    send(pid, {:echo, "Sí funcionó"})
    send(pid, {:echo, "2o Mensaje"})
    # send(pid, :muere)
    # send(pid, "holaaaaa")
    # send(pid, {:echo, "3er Mensaje"})
    # send(pid, {:echo, "4to Mensaje"})
  end

  def echo_process do

    # :timer.sleep(5_000)

    receive do
      {:echo, message} ->
        IO.puts("El mensaje recibido es: " <> message)
        echo_process()
      :muere ->
        IO.puts(" He muerto x_x, 'Let it crash' ")
      _ ->
        IO.puts("No entendí el mensaje")
      after 
        5_000 -> IO.puts("HE MUERTO")
    end

  end

end

defmodule OtrosProcesos do
  def otro_echo do
    IO.puts("Me levanté")
  end
end