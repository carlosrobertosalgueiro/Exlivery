defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "rua projetada",
          "carlos",
          "carlos@.com",
          "11111223123",
          26
        )

      expected_response =
        {:ok,
         %User{
           address: "rua projetada",
           age: 26,
           cpf: "11111223123",
           email: "carlos@.com",
           name: "carlos"
         }}

      assert response == expected_response
    end

    test "when there are ivalid params, return an error" do
      response =
        User.build(
          "rua projetada",
          "carlos jr",
          "carlos@.com",
          "11111223123",
          15
        )

      expected_response = {:error, "invalid parametrs"}

      assert response == expected_response
    end
  end
end
