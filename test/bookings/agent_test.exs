defmodule IgniteElixflightTest.Bookings.AgentTest do
  use ExUnit.Case
  alias IgniteElixflight.Bookings.Agent, as: BookingAgent
  alias IgniteElixflight.Bookings.Booking
  import IgniteElixflight.Factory

  describe "save/1" do
    setup do
      BookingAgent.start_link("")

      :ok
    end

    test "given a valid user, saves de user" do
      user = build(:user)
      date = build(:data)
      origem = "Taubate"
      destino = "Roma"

      {:ok, booking} = Booking.build(user, date, origem, destino)

      assert {:ok, _id} = BookingAgent.save(booking)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link("")

      user = build(:user)
      date = build(:data)
      origem = "Taubate"
      destino = "Roma"

      {:ok, booking} = Booking.build(user, date, origem, destino)

      {:ok, user: user, date: date, origem: origem, destino: destino, booking: booking}
    end

    test "given a valid user, returns an user", %{
      booking: booking
    } do
      {:ok, id} = BookingAgent.save(booking)

      response = BookingAgent.get(id)

      expected_response = {:ok, booking}

      assert expected_response == response
    end

    test "given an invalid user, returns an error", %{booking: booking} do
      response = BookingAgent.get(123)

      assert response == {:error, "Booking not found!"}
    end
  end
end
