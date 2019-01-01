defmodule PrimeWolfWeb.Router do
  use PrimeWolfWeb, :router

  if Mix.env == :dev do
    forward "/",
      Absinthe.Plug.GraphiQL,
      schema: PrimeWolfWeb.Schema,
      socket: PrimeWolfWeb.UserSocket,
      interface: :playground
  else
    forward "/",
      Absinthe.Plug,
      schema: PrimeWolfWeb.Schema,
      socket: PrimeWolfWeb.UserSocket
  end
end
