defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "rua das bananeiras, 165",
          "carlos",
          "carlos@hotmail.com",
          "11111223123",
          27
        )

      expected_response = {:ok, build(:user)}

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
