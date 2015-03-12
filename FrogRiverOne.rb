require_relative 'codility'

def solution(x, time_array)
  position_array = Array.new(x, 0)
  time_array.each_with_index do |leaf_position, time|
    adjusted_leaf_position = leaf_position - 1
    position_array[adjusted_leaf_position] = position_array[adjusted_leaf_position] + 1
    return time if !position_array.include? 0
  end
  return -1
end

# 81%, timed out with big stuff - said O(n) or O(n ** 2)

10.times do 
  benchmark_solution do 
    solution(500, (Array(1..500) + Array(1..499)).shuffle)
  end
end

average_benchmark(50) do
  solution(500, (Array(1..500) + Array(1..499)).shuffle)
end

puts solution(5, [1,2,3,2,2,5,2,3])
