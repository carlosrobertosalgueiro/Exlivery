defmodule Exlivery.Orders.Order do
  alias Exlivery.Users.User
  alias Exlivery.Orders.Item
  @keys [:user_cpf, :delivery_address, :itens, :total_price]

  @enforce_keys @keys

  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _itens] = itens) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       itens: itens,
       total_price: calculate_total_price(itens)
     }}
  end

  def build(_user, _item), do: {:error, "invalid parametrs"}

  defp calculate_total_price(itens) do
    Enum.reduce(itens, Decimal.new("0.00"), &sum_prices(&1, &2))
  end

  defp sum_prices(%Item{unity_price: price, quantity: quantity}, acc) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)
  end
end
