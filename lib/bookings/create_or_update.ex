defmodule FlightReservations.Bookings.CreateOrUpdate do
  alias FlightReservations.Bookings.Agent, as: BookingAgent
  alias FlightReservations.Bookings.Booking

  def call(%{
        user_id: user_id,
        complete_date: complete_date,
        origin_city: origin_city,
        destination_city: destination_city
      }) do
    with {:ok, booking} <- Booking.build(complete_date, origin_city, destination_city, user_id) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end
end
