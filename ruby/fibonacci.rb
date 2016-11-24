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

end

num = 8
print recursive_fib(num)
# Benchmark.bm do |x|
#   x.report("recursive_fib") { recursive_fib(num) }
#   x.report("iterative_fib")  { iterative_fib(num)  }
# end
