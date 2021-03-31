defmodule IgniteElixflight.Bookings.Booking do
  alias IgniteElixflight.Bookings.Date
  alias IgniteElixflight.Users.User

  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]
  @enforce_keys @keys

  defstruct @keys

  def build(
        %User{id: id_usuario},
        %Date{year: year, month: month, day: day, hour: hour, minute: minute, second: second},
        cidade_origem,
        cidade_destino
      ) do
    uuid = UUID.uuid4()
    data_completa = NaiveDateTime.new!(year, month, day, hour, minute, second)

    {:ok,
     %__MODULE__{
       id: uuid,
       data_completa: data_completa,
       cidade_destino: cidade_destino,
       cidade_origem: cidade_origem,
       id_usuario: id_usuario
     }}
  end

  def build(_user, _date_, _origem, _destino), do: {:error, "Invalid Parameter"}
end
