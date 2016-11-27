def find_chain_length(num)
  chain_length = 1
  while num != 1
    num = num.even? ? num/2 : (num * 3) + 1
    chain_length += 1
  end
  chain_length
end

def find_longest_chain(num)
  longest = {
    input: 0,
    length: 0
  }
  (1..num).each do |i|
    chain_length = find_chain_length(i)
    if chain_length > longest[:length]
      longest.update(input: i, length: chain_length)
    end
  end
  puts "Input #{longest[:input]} with length of #{longest[:length]}"
end

find_longest_chain(1000000)
# puts: Input 837799 with length of 525
