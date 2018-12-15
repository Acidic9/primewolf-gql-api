defmodule PrimeWolfWeb.Schema.Types do
	use Absinthe.Schema.Notation

	alias PrimeWolfWeb.Schema.Types

	import_types(Types.UserType)
end