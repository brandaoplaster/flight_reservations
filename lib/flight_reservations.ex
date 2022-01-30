defmodule FlightReservations do
  alias FlightReservations.Bookings.Agent, as: BookingAgent
  alias FlightReservations.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias FlightReservations.Bookings.FlightReport
  alias FlightReservations.Bookings.Search, as: SearchBooking
  alias FlightReservations.Users.Agent, as: UserAgent
  alias FlightReservations.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias FlightReservations.Users.Search, as: SearchUser

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call
  defdelegate get_user_by_cpf(cpf), to: SearchUser, as: :call
  defdelegate get_booking(params), to: SearchBooking, as: :call
  defdelegate generating_report(from_date, to_date), to: FlightReport, as: :call
end
