class Stack
  def initialize
    @stack = []
  end

  def push(item)
    @stack.push(item)
  end

  def pop
    @stack.pop
  end
end

my_stack = Stack.new

puts "Pushing to stack"

puts "Pushing Tommy"
my_stack.push("Tommy")

puts "Pushing Dugger"
my_stack.push("Dugger")

puts "Pushing Programmer"
my_stack.push("Programmer")

puts "The first thing to be popped should be Programmer"
puts my_stack.pop

puts "The second thing to be popped should be Dugger"
puts my_stack.pop

puts "The last thing to be popped should be Tommy"
puts my_stack.pop