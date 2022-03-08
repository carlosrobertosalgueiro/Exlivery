defmodule Exlivery.Users.CreateOrUpdataTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UsersAgent
  alias Exlivery.Users.CreateOrUpdata

  describe "call/1" do
    setup do
      UsersAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "rafael",
        address: "rua das bananeiras",
        email: "rafaelbanana@.com",
        cpf: "12345678900",
        age: 27
      }

      response = CreateOrUpdata.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "rafael",
        address: "rua das bananeiras",
        email: "rafaelbanana@.com",
        cpf: "12345678900",
        age: 10
      }

      response = CreateOrUpdata.call(params)

      expected_response = {:error, "invalid parametrs"}

      assert response == expected_response
    end
  end
end
