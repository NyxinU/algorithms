def make_anagram(a, b)
  a_counter = Hash.new(0)
  b_counter = Hash.new(0)
  difference_counter = 0

  a.each_char { |char| a_counter[char] += 1 }
  b.each_char { |char| b_counter[char] += 1 }

  a_counter.each do |k, _|
    difference = a_counter[k] - b_counter[k]
    difference_counter += difference.abs
  end 

  b_counter.each do |k, v|
    if a_counter.keys.include?(k)
      next
    else 
      difference_counter += v
    end 
  end 

  p difference_counter
end 

make_anagram("bacdc","dcbac")
make_anagram("bacdc","dcbad")