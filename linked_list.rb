# Linked List class
class LinkedList
  attr_reader :size, :head, :tail

  def initialize(head = nil)
    @size = 1
    @head = Node.new(head)
    @tail = @head
  end

  def append(value)
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    @tail = current_node.next_node = Node.new(value)
    @size += 1
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  def at(index)
    return @head.value if index.zero?

    current_node = @head
    (1..index).each do
      current_node = current_node.next_node
    end
    current_node.value
  end

  def pop
    return @head = nil if @size <= 1

    current_node = @head
    previous_node = nil
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    @tail = previous_node
    previous_node.next_node = nil
    @size -= 1
    current_node.value
  end

  def contains?(value)
    current_node = @head
    (1..size).each do
      return true if current_node.value == value

      current_node = current_node.next_node
      end
    false
  end

  def find(value)
    current_node = @head
    (0...size).each do |index|
      return index if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def to_s
    current_node = @head
    until current_node.next_node == nil
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    print "( #{current_node.value} )\n"
  end

  def insert_at(value, index)
    return @head = Node.new(value, @head) if index.zero?

    current_node = @head
    (1...index).each do 
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(value, current_node.next_node)
  end

  def remove_at(index)
    return @head = @head.next_node if index.zero?

    current_node = @head
    (1...index).each do 
      current_node = current_node.next_node
    end
    current_node.next_node = current_node.next_node.next_node
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

# a short demonstration of some of the methods:

text_list = LinkedList.new("Hello!")
text_list.append("goodbye!")
text_list.prepend("surprise!")
text_list.to_s
text_list.insert_at("new!", 3)
text_list.to_s
text_list.remove_at(1)
text_list.to_s
