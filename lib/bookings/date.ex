defmodule IgniteElixflight.Bookings.Date do
  @keys [:year, :month, :day, :hour, :minute, :second]
  @enforce_keys @keys

  defstruct @keys

  def build(year, month, day, hour, minute) do
    %__MODULE__{
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: 0
    }
  end
end
