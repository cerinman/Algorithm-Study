def change_possibilities_bottom_up(amount, denominations)
  ways_of_doing_n_cents = [0] * (amount + 1)
  ways_of_doing_n_cents[0] = 1

  for coin in denominations
    (coin..amount).each do |num|
      higher_amount_remainder = num - coin
      ways_of_doing_n_cents[num] += ways_of_doing_n_cents[higher_amount_remainder]
    end
  end

  p ways_of_doing_n_cents

  return ways_of_doing_n_cents[amount]
end

coins = [1, 5, 10, 25]
amount = 25

p change_possibilities_bottom_up(amount, coins)