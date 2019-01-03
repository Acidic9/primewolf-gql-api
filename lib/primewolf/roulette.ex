defmodule Roulette do
	use GenServer

	# Roulette manage
	# Manages spins, etc.

	def start_link(_state) do
		GenServer.start_link(
			__MODULE__,
			[],
			name: __MODULE__
		)
	end

	@impl true
	def init(_) do
		{:ok, %{:pid => nil}}
	end

	@impl true
	def handle_call(:is_running, _from, state) do
		is_running = case state[:pid] do
			nil -> false
			_ -> true
		end
		{:reply, is_running, state}
	end

	@impl true
	def handle_cast(:run, state) do
		new_state = case state[:pid] do
			nil ->
				pid = spawn &spin_loop/0
				%{state | :pid => pid}

			_ -> state
		end
		{:noreply, new_state}
	end

	@impl true
	def handle_cast(:stop, state) do
		new_state = case state[:pid] do
			nil -> state
			pid ->
				Process.exit(pid, :normal)
				%{state | :pid => nil}
		end
		{:noreply, new_state}
	end

	def spin_loop do
		spin_winner = random_spin()
		Absinthe.Subscription.publish(PrimeWolfWeb.Endpoint, spin_winner, [roulette_spin: "*"])
		:timer.sleep(1000)
		spin_loop()
	end

	def random_spin() do
		coin_one_win_range = [
			0,
			7 / 15,
		]
		coin_two_win_range = [
			Enum.at(coin_one_win_range, 1),
			Enum.at(coin_one_win_range, 1) * 2,
		]
		coin_jackpot_win_range = [
			Enum.at(coin_two_win_range, 1),
			1,
		]
		
		random_float = :rand.uniform()
		# IO.puts random_float
		cond do
			is_in_range(random_float, coin_one_win_range) -> 0;
			is_in_range(random_float, coin_two_win_range) -> 1;
			is_in_range(random_float, coin_jackpot_win_range) -> 2
		end
	end

	def is_in_range(num, [min | [ max | _ ]]) do
		num > min and num < max
	end
end