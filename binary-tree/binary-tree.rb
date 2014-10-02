#In computer science a binary tree is a tree data structure in which each node
#has at most two children, which are referred to as the left child and the
#right child.
#
#https://gist.github.com/yuya-takeyama/812489
#
#A binary tree is made of nodes, where each node contains a left pointer, a
#right pointer, and a data element.  The root pointer points to the topmost
#node in the tree.  The left and right pointers recursively point to smaller
#subtrees on either side.  A null pointer represents a binary tree with no
#elements or an empty tree.

module BinaryTree
  class Node
    attr_reader :word, :count, :left, :right

    include Enumerable

    def initialize(word)
      @word = word
      @count = 1
    end

    def size
      size = 1
      size += @left.size  unless left.nil?
      size += @right.size unless right.nil?
      size
    end

    def insert(another_one)
      case @word <=> another_one.word
        when 1
          insert_into(:left, another_one)
        when 0
          @count += 1
        when -1
          insert_into(:right, another_one)
      end
    end

    def each
      @left.each  {|node| yield node} unless @left.nil?
      yield self
      @right.each {|node| yield node} unless @right.nil?
    end

    def words
      entries.map {|e| e.word}
    end

    def count_all
      self.map {|node| node.count}.reduce(:+)
    end

    def insert_into(destination, another_one)
      var = destination.to_s
      eval(%Q{
          if @#{var}.nil?
            @#{var} = another_one
          else
            @#{var}.insert(another_one)
          end
        })
    end

    protected :insert_into
  end
end

$root = nil

%w{to be or not to be}.each do |word|
  if $root.nil?
    $root = BinaryTree::Node.new(word)
  else
    $root.insert(BinaryTree::Node.new(word))
  end
end

$root.each do |node|
  puts "#{node.word} (#{node.count})"
end

puts
puts "#{$root.size} words."
puts "#{$root.count_all} nodes."