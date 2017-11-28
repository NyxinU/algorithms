require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8 
    @length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    return @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value 
  end

  # O(1)
  def pop
    check_empty
    @store[@length] = nil 
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    check_empty
    0.upto(@capacity) { |idx| @store[idx] = @store[idx + 1] }
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @capacity.downto(0) { |idx| @store[idx] = @store[idx - 1] }
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length        
  end

  def check_empty
    raise "index out of bounds" if @length == 0
  end 

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
