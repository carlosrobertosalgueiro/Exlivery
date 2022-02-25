defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UsersAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UsersAgent.start_link(%{})

      assert UsersAgent.save(user) == :ok
    end
  end
end
