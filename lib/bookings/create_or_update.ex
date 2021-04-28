defmodule FlightReservations.Bookings.CreateOrUpdate do
  alias FlightReservations.Users.Agent, as: UserAgent
  alias FlightReservations.Bookings.Agent, as: BookingAgent
  alias FlightReservations.Users.User
  alias FlightReservations.Bookings.Booking

  def call(%{user_id: user_id, booking: booking}) do
    with {:ok, user} <- UserAgent.get_user_by_id(user_id),
         {:ok, booking} <- build_booking(booking, user) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end

  defp build_booking(
         %{
           complete_date: complete_date,
           origin_city: origin_city,
           destination_city: destination_city,
           user_id: user_id
         },
         %User{id: user_id}
       ) do
    case Booking.build(complete_date, origin_city, destination_city, user_id) do
      {:ok, booking} -> booking
      {:error, _reason} = error -> error
    end
  end
end
