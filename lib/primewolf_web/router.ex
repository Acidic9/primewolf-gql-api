defmodule PrimeWolfWeb.Router do
  use PrimeWolfWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: PrimeWolfWeb.Schema

    if Mix.env == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: PrimeWolfWeb.Schema
    end
  end
end
