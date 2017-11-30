require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8 
    @length = 0 
    @start_idx = 0
    @end_idx = 0 
  end

  # O(1)
  def [](index)
    check_index(index)
    store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    check_empty
    @end_idx -= 1
    el = @store[@end_idx]
    @store[@end_idx] = nil 
    @length -= 1
    return el
  end

  # O(1) ammortized
  def push(val)
    resize! if @capacity == @length
    @store[@end_idx] = val 
    @end_idx += 1 
    @length += 1
  end

  # O(1)
  def shift
    check_empty
    @start_idx = @start_idx % @capacity
    el = @store[@start_idx]
    @store[@start_idx] = nil 
    @start_idx += 1
    @length -= 1
    return el 
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @capacity == @length
    @start_idx = (@start_idx - 1) % @capacity  
    @store[@start_idx] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length  
  end

  def check_empty
    raise "index out of bounds" if @length == 0 
  end 

  def resize!
    old_store = @store.dup 
    @store = StaticArray.new(@capacity*2)
    @capacity.times do |i| 
      @store[i] = old_store[@start_idx % @capacity]
      @start_idx += 1
    end

    @end_idx = @capacity
    @start_idx = 0 
    @capacity = @capacity*2
  end
end
