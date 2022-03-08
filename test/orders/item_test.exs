defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are ivalid, returns an item" do
      response = Item.build("Pizza de calabresa", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an ivalid category, returns an error" do
      response = Item.build("Pizza de calabresa", :banana, "35.5", 1)

      expected_response = {:error, "invalid parametrs"}

      assert response == expected_response
    end

    test "when there is an ivalid price, returns an error" do
      response = Item.build("Pizza de frango", :pizza, "price", 1)

      expected_response = {:error, "invalid price"}

      assert response == expected_response
    end

    test "when there is an ivalid quantity, returns an error" do
      response = Item.build("Pizza de calabresa", :pizza, "35.5", 0)

      expected_response = {:error, "invalid parametrs"}

      assert response == expected_response
    end
  end
end
