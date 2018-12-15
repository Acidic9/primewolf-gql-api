defmodule PrimewolfWeb.Router do
  use PrimewolfWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: PrimewolfWeb.Schema

    if Mix.env == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: PrimewolfWeb.Schema
    end
  end
end
