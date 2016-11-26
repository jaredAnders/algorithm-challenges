def collatz(num)
  chain_length = 1
  while num != 1
    num = num.even? ? num/2 : (num * 3) + 1
    chain_length += 1
  end
  chain_length
end

puts collatz(6)
