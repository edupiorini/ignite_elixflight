defmodule IgniteElixflightTest.Users.CreateUpdateTest do
  use ExUnit.Case

  alias IgniteElixflight.Users.Agent, as: UserAgent
  alias IgniteElixflight.Users.CreateUpdate, as: CreateUpdateUser

  import IgniteElixflight.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link("")

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "given valid parameters, creates an user" do
      params = build(:params)

      response = CreateUpdateUser.call(params)

      assert response == {:ok, "Success! User created"}
    end

    test "given invalid paramaters, returns an error" do
      params = build(:params, cpf: 000)

      response = CreateUpdateUser.call(params)

      assert response == {:error, "Invalid Parameters!"}
    end
  end
end
