defmodule PrimeWolfWeb.Resolvers.UserResolver do
	def users(_, _, _) do
		{
			:ok,
			[
				%{
					id: "69",
					first_name: "Ari",
					last_name: "Seyhun",
					email: "ariseyhun@live.com.au",
					role: "admin"
				},
				%{
					id: "42",
					first_name: "Jimmy",
					last_name: "Lee",
					email: "jimmylee@gmail.com",
					role: "user"
				}
			]
		}
	end
end
