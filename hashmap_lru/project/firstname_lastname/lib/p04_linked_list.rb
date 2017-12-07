class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new("head", nil)
    @tail = Node.new("tail",nil)
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key}
  end

  def include?(key)
    each do |node|
      return true if node.key == key 
    end
    false
  end

  def append(key, val)
    last_node = last
    new_node = Node.new(key, val)
    new_node.prev = last_node
    new_node.next = @tail 
    last_node.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    each { |node| node.val = val if node.key == key}
  end

  def remove(key)
    each { |node| node.remove if node.key == key}
  end

  def each
    current_node = @head.next 

    until current_node == @tail 
      yield current_node
      current_node = current_node.next
    end 
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
