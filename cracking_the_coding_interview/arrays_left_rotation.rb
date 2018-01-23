def left_rotate(length, shift)
  arr = (1..length).to_a

 arr.drop(shift) + arr.take(shift)

end 

print left_rotate(5,4)