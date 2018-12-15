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

  # mutation do
  # end

  # subscription do
  #   field :roulette_spin, :spin do

  #   end
  # end
end
