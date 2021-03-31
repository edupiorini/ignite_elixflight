defmodule IgniteElixflightTest.Factory do
  use ExMachina

  def user_factory do
    %User{
      name: "Eduardo Teste",
      email: "teste@email.com",
      cpf: "12345678900"
    }
  end

  def data_factory do
    %Date{year: 2021, month: 02, day: 22, hour: 20, minute: 10}
  end
end
