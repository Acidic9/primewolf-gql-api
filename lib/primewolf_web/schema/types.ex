defmodule PrimeWolfWeb.Schema.Types do
	use Absinthe.Schema.Notation

	alias PrimeWolfWeb.Schema.Types

	import_types(Types.UserType)
	import_types(Types.SpinType)
	import_types(Types.CoinType)
end