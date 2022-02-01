defmodule FlightReservations.Users.UserSearchTest do
  use ExUnit.Case

  alias FlightReservations.Users.{Agent, Search, User}

  describe "call/1" do
    setup do
      Agent.start_link(%{})

      {:ok, :ok}
    end

    test "when valid parameter" do
      {:ok, user} = User.build("test", "test@gmail.com", "123456789")

      user
      |> Agent.save()

      response =
        user.cpf
        |> Search.call()

      assert {:ok, %User{}} = response
    end

    test "when invalid parameter" do
      assert {:error, "User not found"} = Search.call("09876")
    end
  end
end
