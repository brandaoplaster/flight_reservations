defmodule FlightReservations.Users.Search do
  alias FlightReservations.Users.Agent

  def call(cpf) do
    with {:ok, user} <- Agent.get_user_by_cpf(cpf) do
      {:ok, user}
    else
      error -> error
    end
  end
end
