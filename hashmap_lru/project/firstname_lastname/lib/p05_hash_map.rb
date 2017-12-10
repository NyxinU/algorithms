require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)
    resize! if @count == num_buckets
    linked_list = @store[bucket(key)]

    if linked_list.include?(key)
      linked_list.update(key, val)
    else 
      linked_list.append(key,val)
      @count +=1
    end
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    linked_list = @store[bucket(key)]
    linked_list.remove(key)
    @count -= 1
  end

  def each
    @store.length.times do |idx|
      @store[idx].each do |node|
        yield [node.key, node.val]
      end
    end 
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0 

    old_store.each do |bucket|
      bucket.each { |node| set(node.key, node.val) }
    end
  end

  def bucket(key)
    key.hash % num_buckets
    # optional but useful; return the bucket corresponding to `key`
  end
end
