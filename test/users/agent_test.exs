defmodule IgniteElixflightTest.Users.AgentTest do
  use ExUnit.Case
  alias IgniteElixflight.Users.Agent, as: UserAgent
  import IgniteElixflight.Factory

  describe "save/1" do
    setup do
      UserAgent.start_link("")

      :ok
    end

    test "given a valid user, saves de user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link("")

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "given a valid user, returns an user", %{cpf: cpf} do
      :user
      |> build()
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response = response

      assert expected_response == response
    end

    test "given an invalid user, returns an error" do
      :user
      |> build()
      |> UserAgent.save()

      response = UserAgent.get("123")

      expected_response = {:error, "User not found!"}

      assert expected_response == response
    end
  end
end
