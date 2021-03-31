defmodule IgniteElixflightTest.Bookings.CreateUpdateTest do
  use ExUnit.Case

  alias IgniteElixflight.Bookings.CreateUpdate, as: CreateUpdateBooking
  alias IgniteElixflight.Users.CreateUpdate, as: CreateUpdateUser

  import IgniteElixflight.Factory

  describe "call/2" do
    setup do
      IgniteElixflight.start_agents()

      cpf = "12345678900"

      params = build(:params)

      user = CreateUpdateUser.call(params)

      data = build(:data)

      {:ok, cpf: cpf, data: data, user: user}
    end

    test "given valid parameters, creates a booking", %{cpf: cpf, data: data} do
      params = %{data_completa: data, cidade_origem: "Taubate", cidade_destino: "Roma"}

      assert {:ok, _id} = CreateUpdateBooking.call(cpf, params)
    end

    test "given invalid paramaters, returns an error", %{data: data} do
      params = %{data_completa: data, cidade_origem: "Taubate", cidade_destino: "Roma"}

      response = CreateUpdateBooking.call(123, params)

      assert response == {:error, "User not found!"}
    end
  end
end
