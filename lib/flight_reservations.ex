defmodule FlightReservations do

  alias FlightReservations.Users.Agent, as: UserAgent
  alias FlightReservations.Bookings.Agent, as: BookingAgent
  alias FlightReservations.Users.CreateOrUpdate, as:  CreateOrUpdateUser
  alias FlightReservations.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias FlightReservations.Bookings.Search, as: SearchBooking

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call
  defdelegate get_booking(params), to: SearchBooking, as: :call
end
