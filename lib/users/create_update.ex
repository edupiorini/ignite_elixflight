defmodule IgniteElixflight.Users.CreateUpdate do
  alias IgniteElixflight.Users.Agent, as: UserAgent
  alias IgniteElixflight.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)

    {:ok, "Success! User created"}
  end

  defp save_user({:error, _reason} = error), do: error
end
