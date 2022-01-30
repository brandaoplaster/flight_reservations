defmodule FlightReservations.Bookings.FlightReport do
  alias FlightReservations.Bookings.{Agent, Booking}

  def call(from_date, to_date) do
    content =
      Agent.list()
      |> Map.values()
      |> Enum.filter(&filter_flights_by_date(&1, from_date, to_date))
      |> Enum.map(&parse_line(&1))

    generate_report_file(content)
  end

  defp filter_flights_by_date(%{complete_date: complete_date}, from_date, to_date) do
    Date.range(from_date, to_date)
    |> Enum.member?(NaiveDateTime.to_date(complete_date))
  end

  defp parse_line(%Booking{
         user_id: user_id,
         origin_city: origin_city,
         destination_city: destination_city,
         complete_date: complete_date
       }) do
    complete_date =
      complete_date
      |> NaiveDateTime.to_string()

    "#{user_id},#{origin_city},#{destination_city},#{complete_date}\n"
  end

  defp generate_report_file(content) do
    with :ok <- File.write("reports/report-bookings.csv", content) do
      {:ok, "Report generated successully"}
    end
  end
end
