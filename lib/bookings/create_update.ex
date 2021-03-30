defmodule IgniteElixflight.Bookings.CreateUpdate do
  alias IgniteElixflight.Bookings.Agent, as: BookingAgent
  alias IgniteElixflight.Bookings.Booking
  alias IgniteElixflight.Users.Agent, as: UserAgent

  def call(%{
        cpf: cpf,
        data_completa: data_completa,
        cidade_origem: cidade_origem,
        cidade_destino: cidade_destino
      }) do
    with {:ok, user} <- UserAgent.get(cpf),
         {:ok, booking} <- Booking.build(user, data_completa, cidade_origem, cidade_destino) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end
end
