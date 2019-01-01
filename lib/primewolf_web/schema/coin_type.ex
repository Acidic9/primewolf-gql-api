defmodule PrimeWolfWeb.Schema.Types.CoinType do
	use Absinthe.Schema.Notation

	enum :coin_type do
		value :light
		value :dark
		value :jackpot
	end
end