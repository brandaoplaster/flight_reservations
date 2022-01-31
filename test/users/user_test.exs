defmodule FlightReservations.Users.UserTest do
  use ExUnit.Case

  alias FlightReservations.Users.User

  describe "build/4" do
    test "when parameters are valid" do
      assert {:ok, %User{}} = User.build("test", "test@gmail.com", "123456789")
    end

    test "when parameters are not valid" do
      assert {:error, "Invalid params"} = User.build("test", "test@gmail.com", 1_234_567)
    end
  end
end
