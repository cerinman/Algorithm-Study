class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue << item
  end

  def dequeue
    @queue.shift
  end
end

my_queue = Queue.new

puts "Adding to queue Tommy, Jared, and then Hondo"

my_queue.enqueue("Tommy")
my_queue.enqueue("Jared")
my_queue.enqueue("Hondo")

puts "Serving the first person in line should result in Tommy being served"
puts my_queue.dequeue

puts "Serving the next person in line should result in Jared being served"
puts my_queue.dequeue

puts "Serving the next person in line should result in Hondo being served"
puts my_queue.dequeue