defmodule FlightReservations.Bookings.Booking do
  @keys [:id, :complete_date, :origin_city, :destination_city, :user_id]
  @enforce_keys @keys

  defstruct @keys

  def build(complete_date, origin_city, destination_city, user_id) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       complete_date: complete_date,
       origin_city: origin_city,
       destination_city: destination_city,
       user_id: user_id
     }}
  end
end
