defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "rua das bananeiras, 165",
      name: "carlos",
      email: "carlos@hotmail.com",
      cpf: "11111223123",
      age: 27
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de calabresa",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "rua das bananeiras, 165",
      itens: [
        build(:item),
        build(:item,
          description: "temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "11111223123"
    }
  end
end
