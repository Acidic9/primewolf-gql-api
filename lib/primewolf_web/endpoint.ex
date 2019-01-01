defmodule PrimeWolfWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :primewolf
  use Absinthe.Phoenix.Endpoint

  socket "/ws", PrimeWolfWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  def publish_mutation(_, _, _) do
    :ok
  end

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_primewolf_key",
    signing_salt: "QtN/9Nnn"

  plug CORSPlug

  plug PrimeWolfWeb.Router
end
