def solution(array)
    return array.reduce(:*) if array.size == 3
    sorted = array.sort
    
    a, b =  sorted.first(2)
    x, y, z = sorted.last(3)
    
    return x*y*z if a > 0 && b > 0
    
    if x >= 0 && y >= 0 && z > 0
        if (a.abs > x && b.abs > y) || ((a.abs - x) + (b.abs - y) > 0)
            return a*b*z
        elsif x > 0 && y > 0 && z > 0
            return x*y*z
        end
    elsif z <= 0
      return x*y*z
    elsif x < 0 && y > 0
      return a*b*z
    elsif x < 0 && y < 0
      return a*b*z
    elsif x < 0 && y == 0
      return a*b*z
    end
end

# 88%, one wrong test case
