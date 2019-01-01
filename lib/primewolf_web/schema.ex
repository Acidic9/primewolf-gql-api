defmodule PrimeWolfWeb.Schema do
  use Absinthe.Schema
  alias PrimeWolfWeb.Resolvers

  # Import Types
  import_types(PrimeWolfWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field(:users, list_of(:user_type)) do
      # Resolver
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    field :spin, :boolean do
      resolve &Resolvers.SpinResolver.spin/2
    end
  end

  subscription do
    field :roulette_spin, :integer do
      config fn args, _info ->
        # IO.puts args
        # IO.inspect args
        # IO.inspect info
        {:ok, topic: "*"}
      end

      # trigger :spin, topic: fn a ->
      #   "*"
      # end
    end
    # field :roulette_spin, :boolean
  end
end
