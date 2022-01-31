defmodule FlightReservations.Users.UserAgentTest do
  use ExUnit.Case

  alias FlightReservations.Users.{Agent, User}

  describe "save/1" do
    setup do
      Agent.start_link(%{})

      {:ok, :ok}
    end

    test "when parameters are valid" do
      {:ok, user} = User.build("test", "test@gmail.com", "123456789")

      response =
        user
        |> Agent.save()

      assert {:ok, _} = response
    end
  end

  describe "get_user_by_cpf/1" do
    setup do
      Agent.start_link(%{})

      {:ok, :ok}
    end

    test "when the cpf is valid" do
      {:ok, user} = User.build("test", "test@gmail.com", "123456789")

      user
      |> Agent.save()

      response =
        user.cpf
        |> Agent.get_user_by_cpf()

      assert {:ok, %User{}} = response
    end

    test "when the cpf is invalid" do
      response = Agent.get_user_by_cpf("122")

      assert {:error, "User not found"} = response
    end
  end
end
