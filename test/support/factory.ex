defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "rua das bananeiras, 165",
      name: "carlos",
      email: "carlos@hotmail.com",
      cpf: "11111223123",
      age: 27
    }
  end
end
