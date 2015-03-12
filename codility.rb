require "benchmark"

def benchmark_solution
  time = Benchmark.realtime do
    yield
  end
  puts "Time elapsed #{time*1000}ms"
end

def average_benchmark(count)
  times = []
  count.times do 
    times << Benchmark.realtime do 
      yield
    end
  end
  average = times.instance_eval { reduce(:+) / size.to_f }
  puts "Average time elapsed #{average*1000}ms"
end
