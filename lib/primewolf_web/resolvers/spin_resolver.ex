defmodule PrimeWolfWeb.Resolvers.SpinResolver do
	def spin(_, _) do
		Absinthe.Subscription.publish(PrimeWolfWeb.Endpoint, :roulette_spin, [roulette_spin: :false])
		{:ok, :true}
	end
end
