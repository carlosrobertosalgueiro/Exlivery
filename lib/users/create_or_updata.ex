defmodule Exlivery.Users.CreateOrUpdata do
  alias Exlivery.Users.User
  alias Exlivery.Users.Agent, as: UsersAgent

  def call(%{name: name, address: address, email: email, cpf: cpf, age: age}) do
    address
    |> User.build(name, email, cpf, age)
    |> save_user()
  end

  def save_user({:ok, %User{} = user}), do: UsersAgent.save(user)

  def save_user({:error, _reason} = error), do: error
end
