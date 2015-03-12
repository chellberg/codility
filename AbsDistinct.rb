def solution(a)
    a.uniq{ |e| e.abs }.size
end

# counts number of unique integers in array a, ignoring negative/positive
