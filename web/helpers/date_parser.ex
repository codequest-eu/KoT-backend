defmodule Kot.DateParser do

  # Parse "12/13 17:52:00.206" to an Ecto.DateTime
  def to_ecto_datetime(date) do
    date
    |> Timex.parse!("%m/%d %H:%M:%S.%f", :strftime)
    |> Ecto.DateTime.cast!
  end
end
