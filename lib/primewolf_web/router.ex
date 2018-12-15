defmodule PrimewolfWeb.Router do
  use PrimewolfWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PrimewolfWeb do
    pipe_through :api
  end
end
