defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order
  # alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are ivalid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is an ivalid category, returns an error" do
      user = build(:user)
      items = []
      response = Order.build(user, items)

      expected_response = {:error, "invalid parametrs"}

      assert response == expected_response
    end
  end
end
