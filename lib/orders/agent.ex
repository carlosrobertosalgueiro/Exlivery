defmodule Exlivery.Orders.Agent do
  alias Exlivery.Orders.Order

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Order{} = order) do
    uuid = UUID.uuid4()

    Agent.update(__MODULE__, &updata_state(&1, order, uuid))

    {:ok, uuid}
  end

  def get(uuid) do
    Agent.get(__MODULE__, &get_order(&1, uuid))
  end

  def list_all, do: Agent.get(__MODULE__, & &1)

  defp get_order(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "order not found"}
      order -> {:ok, order}
    end
  end

  defp updata_state(state, %Order{} = order, uuid) do
    Map.put(state, uuid, order)
  end
end
