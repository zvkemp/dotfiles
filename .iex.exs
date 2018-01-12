defmodule Pb do
  def pbcopy(string) when is_binary(string) do
    with port <- Port.open({:spawn, "pbcopy"}, [:binary]),
         true <- Port.command(port, string),
         true <- Port.close(port)
    do
      true
    end
  end

  def pbpaste do
    {data, 0} = System.cmd("pbpaste", [])
    data
  end
end
