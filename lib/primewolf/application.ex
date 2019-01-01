defmodule PrimeWolf.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  # TODO: Remove this function when new release of Absinthe is released.
  def absinthe_subscriptions(name) do
    %{
      type: :supervisor,
      id: Absinthe.Subscription,
      start: {Absinthe.Subscription, :start_link, [name]}
    }
  end

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      # PrimeWolf.Repo,
      # Start the endpoint when the application starts
      PrimeWolfWeb.Endpoint,
      # TODO: Use the following code instead when the new release of Absinthe is released.
      # { Absinthe.Subscription, [PrimeWolfWeb.Endpoint] },
      absinthe_subscriptions(PrimeWolfWeb.Endpoint),
      # Starts a worker by calling: PrimeWolf.Worker.start_link(arg)
      # {PrimeWolf.Worker, arg},

      { Roulette, [] },
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PrimeWolf.Supervisor]
    ret = Supervisor.start_link(children, opts)

    spawn fn ->
      :timer.sleep(1000)
      GenServer.call(Roulette, :run)
    end

    ret
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PrimeWolfWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
