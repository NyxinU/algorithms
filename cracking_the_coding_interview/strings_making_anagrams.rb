def make_anagram(string1, string2)
  string1_counter = Hash.new(0)
  string2_counter = Hash.new(0)
  difference_counter = 0

  string1.each_char { |char| string1_counter[char] += 1 }
  string2.each_char { |char| string2_counter[char] += 1 }

  string1_counter.each do |k, _|
    difference = string1_counter[k] - string2_counter[k]
    difference_counter += difference.abs
  end 

  string2_counter.each do |k, v|
    if string1_counter.keys.include?(k)
      next
    else 
      difference_counter += v
    end 
  end 

  p difference_counter
end 

make_anagram("bacdc","dcbac")
make_anagram("bacdc","dcbad")