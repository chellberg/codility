def solution(n, a)
  counters = Array.new(n, 0)
  a.each_with_index do |element, value|
      if element == n + 1
          counters = Array.new(n, counters.max)
      else
          counters[element -1 ] += 1
      end
  end
  counters
end

# 66% - O(N*M) rather than O(N+M)
