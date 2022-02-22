defmodule Exlivery do
  alias Exlivery.Users.CreateOrUpdata
  alias Exlivery.Users.Agent, as: UsersAgent

  def start_agents() do
    UsersAgent.start_link(%{})
  end

  defdelegate create_or_updata_user(params), to: CreateOrUpdata, as: :call
end
