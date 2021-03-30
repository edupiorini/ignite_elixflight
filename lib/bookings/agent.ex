defmodule IgniteElixflight.Bookings.Agent do
  use Agent

  alias IgniteElixflight.Bookings.Booking

  def start_link(_init_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%Booking{} = booking) do
    id = UUID.uuid4()

    Agent.update(__MODULE__, &update_state(&1, booking, id))

    {:ok, id}
  end

  def get(id), do: Agent.get(__MODULE__, &get_booking(&1, id))

  defp get_booking(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "Booking not found!"}
      booking -> {:ok, booking}
    end
  end

  def get_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(state, %Booking{} = booking, id), do: Map.put(state, id, booking)
end
