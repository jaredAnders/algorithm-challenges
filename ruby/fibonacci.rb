require 'benchmark'

def recursive_fib(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return recursive_fib(n - 1) + recursive_fib(n - 2)
  end
end

def iterative_fib(n)
  sum = []
  (n + 1).times do |x|
    if x == 0
      sum.push(0)
    elsif x == 1
      sum.push(1)
    else
      nextNum = sum[x-1] + sum[x-2]
      sum.push(nextNum)
    end
  end
  sum.last
end

num = 35
# print recursive_fib(num)
# print "\n"
# print iterative_fib(num)
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end
