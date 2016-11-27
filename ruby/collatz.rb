require 'benchmark'

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
  return "Input #{longest[:input]} has the longest chain with length of #{longest[:length]} \n"
end

range = 1000000
puts find_longest_chain(range) # puts: Input 837799 with length of 525

Benchmark.bm do |x|
  x.report("flc") { find_longest_chain(range)}
end
