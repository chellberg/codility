def solution(a)
  pref = prefix_sums(a)
end

def prefix_sums(a)
  pref = Array.new(a.size + 1, 0)
  (1..(a.size + 1)).each do |i|
    pref[i] = pref[i-1] + a[i-1] # the sum at i is the sum up to and including the previous element plus the 
  end
end
