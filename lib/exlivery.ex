defmodule Exlivery do
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Users.CreateOrUpdata, as: CreateOrUpdataUser
  alias Exlivery.Orders.CreateOrUpdata, as: CreateOrUpdataOrders

  def start_agents() do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_updata_user(params), to: CreateOrUpdataUser, as: :call
  defdelegate create_or_updata_order(params), to: CreateOrUpdataOrders, as: :call
end
