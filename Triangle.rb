def solution(array)
    # write your code in Ruby 2.2
    array.sort!
    array.each_with_index do |element, index|
        next if array.size - index < 3
        p, q, r = array[index..(index+2)]
        if p + q > r && q + r > p && r + p > q
            return 1
        end
    end
    return 0
end

puts solution [4,5,6]

