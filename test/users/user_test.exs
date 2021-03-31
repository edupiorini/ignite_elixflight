defmodule IgniteElixflightTest.UserTest do
  use ExUnit.Case

  alias IgniteElixflight.Users.User

  import IgniteElixflight.Factory

  describe "build/3" do
    test "given valid params, creates an user" do
      user = build(:user)

      response = User.build(user.name, user.email, user.cpf)

      expected_response = response

      assert expected_response == response
    end

    test "given invalid params, returns an error" do
      user = build(:user)

      response = User.build(user.name, user.email, 123)

      expected_response = {:error, "Invalid Parameters!"}

      assert expected_response == response
    end
  end
end
