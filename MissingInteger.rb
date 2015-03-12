require_relative 'codility'

def solution(array, x)
  return 0 if array.empty?
  x_indicies = []
  array.each_with_index do |n, index|
    x_indicies << index if n == x
  end

  just_passed_k = false

  x_indicies.each_with_index do |x, index|
    right_elements_count = array.length - (x + 1)
    right_x_elements_count = x_indicies.length - (index + 1)

    
    right_non_x_elements_count = right_elements_count - right_x_elements_count
    
    if right_non_x_elements_count < index
      just_passed_k = true
    end

    if just_passed_k
      k_search_index = x - 1
      until k_search_index < x_indicies[index - 1] do 
        inner_right_elements_count = array.length - (k_search_index + 1)
        inner_right_non_x_elements_count = inner_right_elements_count - right_x_elements_count
        left_x_elements_count = index
        return k_search_index if left_x_elements_count == inner_right_non_x_elements_count
        k_search_index -= 1
      end
    end

    if index == right_non_x_elements_count
      return index
    end
  end
  
  return -1
end


def worse_solution(array, x)
  array.each_with_index do |element, index|
    left_x_count = array[(0..(index-1))].select{|e| e == x}.count
    right_non_x_count = array[(index..(array.size - 1))].select{|e| e != x}.count
    if left_x_count == right_non_x_count
      return index 
    end
  end
end

puts "solution is #{solution([5,5,1,7,2,3,5], 5)}"
puts "solution is #{worse_solution([5,5,1,7,2,3], 5)}"

puts 'good solution'
average_benchmark(50) do 
  solution([5,5,1,7,2,3,5], 5)
end

puts 'worse solution'
average_benchmark(50) do
  worse_solution([5,5,1,7,2,3,5], 5)
end
    



