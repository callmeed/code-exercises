#!/usr/bin/ruby

# References/inspiration: https://www.rubyguides.com/2017/08/ruby-linked-list/
# 
# Include in irb with `irb -r ./linked_list.rb`

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if empty?
      @head = Node.new(value) 
    else
      tail.next = Node.new(value)
    end
  end

  def tail
    return @head if empty?
    node = @head
    while !node.next.nil?
      node = node.next
    end
    return node
  end

  def empty?
    @head.nil?
  end

  def size
    return 0 if empty?
    node = @head
    size = 1
    while !node.next.nil?
      node = node.next
      size += 1
    end
    size
  end

  def to_s
    return "[Empty LinkedList]" if empty?
    node = @head
    return_value = node.to_s + "\n"
    while !node.next.nil?
      node = node.next
      return_value += node.to_s + "\n"
    end
    return_value
  end
end

class Node
  attr_accessor :next
  attr_accessor :value

  def initialize(value)
    @next = nil
    @value = value
  end

  def to_s
    return "Node with value: #{@value} (no pointer to next node present)" if @next.nil?
    "Node with value: #{@value} (next node present)"
  end
end

if __FILE__ == $0
  l = LinkedList.new
  l.append(1)
  l.append(2)
  l.append(3)
  puts "Linked list has size of #{l.size}"
  puts "Tail has value of #{l.tail.value}"
end