# Flight Reservations

Application for managing flight reservations.

# Guide

 - Starting the agents
```
FlightReservations.start_agents
```

 - User parameters
```
params_user = %{name: "phoenix", email: "p@gmail.com", cpf: "00013890"}
```

 - Creating a user
```
{:ok, id} = FlightReservations.create_or_update_user(params_user)
```

 - Booking parameters
```
params_booking = %{complete_date: "2021-04-17 14:00:00",
           origin_city: "New city",
           destination_city: "Last City",
           user_id: id}
```

 - Creating a booking
```
{:ok, booking_id} = FlightReservations.create_or_update_booking(params_booking)
```

 - Fetching a booking by id
```
FlightReservations.get_booking(booking_id)
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `flight_reservations` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:flight_reservations, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/flight_reservations](https://hexdocs.pm/flight_reservations).

