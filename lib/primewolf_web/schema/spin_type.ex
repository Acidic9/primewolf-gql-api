defmodule PrimeWolfWeb.Schema.Types.SpinType do
	use Absinthe.Schema.Notation

	object :spin_type do
		field(:winner,         :coin_type)
	end

	# input_object :spin_input_type do
	# 	field(:first_name,            non_null(:string))
	# 	field(:last_name,             non_null(:string))
	# 	field(:email,                 non_null(:string))
	# 	field(:password,              non_null(:string))
	# 	field(:password_confirmation, non_null(:string))
	# end
end