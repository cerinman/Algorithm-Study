class Node

  attr_accessor :value, :left_child, :right_child

  def initialize(value)
    @value = value
  end
end

class BTreeBuilder

  attr_accessor :root

  def initialize(root = nil)
    @root = Node.new(root)
  end

  def build_tree(array)
    if @root.value.nil?
      @root = Node.new(array.shift)
    end

    array.each do |node|
      insert_node(node, @root)
    end
  end

  def insert_node(value, node)
    if value < node.value
      if node.left_child.nil?
        node.left_child = Node.new(value)
      else
        insert_node(value, node.left_child)
      end
    elsif value > node.value
      if node.right_child.nil?
        node.right_child = Node.new(value)
      else
        insert_node(value, node.right_child)
      end
    else
      puts "There was a duplicate '#{value}'.  Only one instance is included!"
    end
  end

  def print_tree
    queue = [@root]

    while !queue.empty?
      current_node = queue.shift
      puts current_node.value
      queue.unshift(current_node.left_child)  if !current_node.left_child.nil?
      queue.unshift(current_node.right_child) if !current_node.right_child.nil?
    end
  end

  def breadth_first_search(item)
    queue = [@root]

    while !queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == item
      queue.unshift(current_node.left_child)  if !current_node.left_child.nil?
      queue.unshift(current_node.right_child) if !current_node.right_child.nil?
    end

    puts "Item not found"
    return nil
  end
end

array = [5,3,4,6,1,99,100,45,63]
tree = BTreeBuilder.new
tree.build_tree(array)

puts tree.breadth_first_search(3).right_child.value

tree.print_tree