defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UsersAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UsersAgent.start_link(%{})

      assert UsersAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    test "when the user is found, returns the user" do
      UsersAgent.start_link(%{})

      :user
      |> build(cpf: "98765432100")
      |> UsersAgent.save()

      response = UsersAgent.get("98765432100")

      expected_response =
        {:ok,
         %User{
           address: "rua das bananeiras, 165",
           age: 27,
           cpf: "98765432100",
           email: "carlos@hotmail.com",
           name: "carlos"
         }}

      assert response == expected_response
    end

    test "when the user is found, returns an error" do
      UsersAgent.start_link(%{})

      response = UsersAgent.get("00000000000")

      expected_response = {:error, "user not found"}

      assert response == expected_response
    end
  end
end
