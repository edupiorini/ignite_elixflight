defmodule IgniteElixflightTest.BookingTest do
  use ExUnit.Case

  alias IgniteElixflight.Bookings.Booking

  import IgniteElixflight.Factory

  describe "build/4" do
    test "given parameters, builds a booking" do
      user = build(:user)
      data = build(:data)
      origem = "Taubate"
      destino = "Roma"

      response = Booking.build(user, data, origem, destino)

      expected_response = response

      assert expected_response == response
    end

    test "given invalid parameters, returns an error" do
      user = "José"
      data = build(:data)
      origem = "Taubate"
      destino = "Roma"

      response = Booking.build(user, data, origem, destino)

      assert response == {:error, "Invalid Parameter"}
    end
  end
end
