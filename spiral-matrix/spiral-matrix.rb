require 'benchmark'

#Using built in Ruby methods
#####################################################
def spiral_one(arr)
  result_array = []

  while !arr.empty?
    result_array.push(arr.shift)
    arr = arr.transpose
    arr = arr.reverse
  end

  result_array.flatten
end

#Better way but still using pop and shift
#and being destructive
####################################################
class Spiral_Two
  def initialize(matrix)
    @matrix = matrix
    @result = []
  end

  def solve
    traverse_right_and_down
    @result
  end

  private

  def traverse_right_and_down
    @matrix[0].length.times do |i|
      @result << @matrix[0][i]
    end

    @matrix.shift

    @matrix.length.times do |i|
      @result << @matrix[i].pop
    end

    traverse_left_and_up unless @matrix.empty?
  end

  def traverse_left_and_up
    @matrix[-1].length.times do |i|
      @result << @matrix[-1].pop
    end

    @matrix.pop

    @matrix.length.times do |i|
      @result << @matrix.last.shift
    end

    traverse_right_and_down unless @matrix.empty?
  end
end

#Best way that I have found.  It uses coordinates and is not destructive.
####################################################

class Spiral_Three
  def initialize(matrix)
    @matrix = matrix
    @result = []
  end

  def solve
    traverse_right_and_down(0, 0, @matrix.first.size - 1, @matrix.size - 1)
    @result
  end

  private

  def traverse_right_and_down(x1, y1, x2, y2)
    @result ||= []

    #Traverse right from top
    (x1..x2).each do |i|
      @result << @matrix[y1][i]
    end

    #Traverse down on right side
    ((y1 + 1)..(y2)).each do |i|
      @result << @matrix[i][x2]
    end

    traverse_left_and_up(x1, y1 + 1, x2 - 1, y2) if x2 - x1 > 0
  end

  def traverse_left_and_up(x1, y1, x2, y2)
    @result ||= []

    #Traverse left from bottom
    (x2).downto(x1).each do |i|
      @result << @matrix[y2][i]
    end

    #Traverse up on left side
    (y2 - 1).downto(y1).each do |i|
      @result << @matrix[i][x1]
    end

    traverse_right_and_down(x1 + 1, y1, x2, y2 - 1) if x2 - x1 > 0
  end
end

#Test Cases
####################################################

matrix_one =   [[1,2,3],
                [4,5,6],
                [7,8,9]]

matrix_two =   [[1,2,3],
                [4,5,6],
                [7,8,9]]

matrix_three = [[1,2,3],
                [4,5,6],
                [7,8,9]]

spiral_two   = Spiral_Two.new(matrix_two)
spiral_three = Spiral_Three.new(matrix_three)

#Case #1
puts "Using built in Ruby methods transpose and reverse"
puts Benchmark.measure { puts spiral_one(matrix_one) == [1, 2, 3, 6, 9, 8, 7, 4, 5] }
puts

#Case #2 <-This one does better than case #3 benchmark some times.
puts "A slightly better way but still using destructive methods pop and shift on original array."
puts Benchmark.measure { puts spiral_two.solve == [1, 2, 3, 6, 9, 8, 7, 4, 5] }
puts

#Case #3
puts "Best way that I've found so far.  Uses coordinates and is not destructive."
puts Benchmark.measure { puts spiral_three.solve == [1, 2, 3, 6, 9, 8, 7, 4, 5] }
