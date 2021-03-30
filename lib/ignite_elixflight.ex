defmodule IgniteElixflight do
  alias IgniteElixflight.Bookings.Agent, as: BookingAgent
  alias IgniteElixflight.Bookings.CreateUpdate, as: CreateUpdateBooking

  alias IgniteElixflight.Users.Agent, as: UserAgent
  alias IgniteElixflight.Users.CreateUpdate, as: CreateUpdateUser

  def start_agents do
    BookingAgent.start_link({})
    UserAgent.start_link({})
  end

  defdelegate(create_user(params), to: CreateUpdateUser, as: :call)
  defdelegate(create_booking(user_cpf, params), to: CreateUpdateBooking, as: :call)
  defdelegate(get_booking(params), to: BookingAgent, as: :get)
end
