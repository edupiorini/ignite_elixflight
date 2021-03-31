defmodule IgniteElixflight.Factory do
  use ExMachina

  alias IgniteElixflight.Bookings.Date
  alias IgniteElixflight.Users.User

  def user_factory do
    %User{
      id: UUID.uuid4(),
      name: "Eduardo Teste",
      email: "teste@email.com",
      cpf: "12345678900"
    }
  end

  def data_factory do
    %Date{year: 2021, month: 02, day: 22, hour: 20, minute: 10, second: 0}
  end
end
