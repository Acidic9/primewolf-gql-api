defmodule PrimeWolfWeb.UserSocket do
  use Phoenix.Socket

  use Absinthe.Phoenix.Socket,
    schema: PrimeWolfWeb.Schema

  ## Channels
  # channel "room:*", PrimeWolfWeb.RoomChannel

  # def init(req, state) do
  #   case cowboy
  # end

  # init(Req0, State) ->


  #   case cowboy_req:parse_header(<<"sec-websocket-protocol">>, Req0) of
  #       undefined ->
  #           {cowboy_websocket, Req0, State};
  #       Subprotocols ->
  #           case lists:keymember(<<"mqtt">>, 1, Subprotocols) of
  #               true ->
  #                   Req = cowboy_req:set_resp_header(<<"sec-websocket-protocol">>,
  #                       <<"mqtt">>, Req0),
  #                   {cowboy_websocket, Req, State};
  #               false ->
  #                   Req = cowboy_req:reply(400, Req0),
  #                   {ok, Req, State}
  #           end
  #   end.

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(params, socket, connect_info) do
    IO.puts "CONNECTED"
    IO.inspect connect_info
    # spawn fn ->
    #   :timer.sleep(4000)
    #   IO.puts "SEND SUB"
    #   Absinthe.Subscription.publish(PrimeWolfWeb.Endpoint, :false, [roulette_spin: "*"])
    # end

    # socket = Absinthe.Phoenix.Socket.put_options(socket, context: %{
    # })
    # socket = Absinthe.Phoenix.Socket.put_schema(socket, PrimeWolfWeb.Schema)

    {:ok, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     PrimeWolfWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
