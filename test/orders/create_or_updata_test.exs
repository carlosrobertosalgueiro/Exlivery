defmodule Exlivery.Orders.CreateOrUpdataTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UsersAgent
  alias Exlivery.Orders.CreateOrUpdata

  describe "call/1" do
    setup do
      cpf = "12332112300"

      user = build(:user, cpf: cpf)
      Exlivery.start_agents()
      UsersAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "pizza de calabresa",
        quantity: 1,
        unity_price: "35.5"
      }

      item2 = %{
        category: :pizza,
        description: "pizza de frango",
        quantity: 1,
        unity_price: "35.5"
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdata.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "00000000000000000", items: [item1, item2]}

      response = CreateOrUpdata.call(params)

      expected_response = {:error, "user not found"}

      assert response == expected_response
    end

    test "when there are ivalid items, returns an error", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdata.call(params)

      expected_response = {:error, "invalid items"}

      assert response == expected_response
    end

    test "when there are no items, returns an error", %{user_cpf: cpf} do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdata.call(params)

      expected_response = {:error, "invalid parametrs"}

      assert response == expected_response
    end
  end
end
