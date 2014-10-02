#In computer science, a linked list is a data structure consisting of a
#group of nodes which together represent a sequence. Under the simplest
#form, each node is composed of a data and a reference (in other words,
#a link) to the next node in the sequence; more complex variants add
#additional links.

class Node
  attr_accessor :value, :next_node

  def initialize(val, next_in_line)
    @value = val
    @next_node = next_in_line
  end
end

class LinkedList
  def initialize(val)
    @head = Node.new(val, nil)
  end

  def add(value)
    current = @head

    while current.next_node != nil
      current = current.next_node
    end

    current.next_node = Node.new(value, nil)
  end

  def delete(val)
    current = @head

    if current.value == val
      @head = @head.next_node
    else
      current = @head

      while (current != nil) && (current.next_node != nil) && ((current.next_node).value != val)
        current = current.next_node
      end

      if (current != nil) && (current.next_node != nil)
        current.next_node = (current.next_node).next_node
      end
    end
  end

  def display
    current = @head
    full_list = []

    while current.next_node != nil
      full_list += [current.value.to_s]
      current = current.next_node
    end

    full_list += [current.value.to_s]
    puts full_list.join("->")
  end
end

my_list = LinkedList.new(5)

my_list.add(10)
my_list.add(20)

puts "Displaying Linked List:"
my_list.display

puts "Delete 10 and then display the linked list again"
my_list.delete(10)
my_list.display

my_list.delete(2)