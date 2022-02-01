defmodule FlightReservations.Users.CreateOrUpdateTest do
  use ExUnit.Case, async: true

  alias FlightReservations.Users.{Agent, CreateOrUpdate, Search, User}

  describe "call/1" do
    setup do
      Agent.start_link(%{})

      {:ok, :ok}
    end

    test "when creating a user with valid parameters" do
      user_params = %{
        name: "test",
        email: "test@gmail.com",
        cpf: "123456"
      }

      assert {:ok, _user_id} = CreateOrUpdate.call(user_params)
      assert {:ok, %User{}} = Search.call(user_params.cpf)
    end

    test "when creating a user with invalid parameters" do
      user_params = %{
        name: "test",
        email: "test@gmail.com",
        cpf: 123
      }

      assert {:error, "Invalid params"} = CreateOrUpdate.call(user_params)
      assert {:error, "User not found"} = Search.call(user_params.cpf)
    end
  end
end
