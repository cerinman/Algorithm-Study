# http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/

#A Beginner’s Guide to Big O Notation
#
#Big O notation is used in Computer Science to describe the
#performance or complexity of an algorithm. Big O specifically
#describes the worst-case scenario, and can be used to describe
#the execution time required or the space used (e.g. in memory
#or on disk) by an algorithm.
#
#Anyone who’s read Programming Pearls or any other Computer
#Science books and doesn’t have a grounding in Mathematics will
#have hit a wall when they reached chapters that mention O(N log N)
#or other seemingly crazy syntax. Hopefully this article will help
#you gain an understanding of the basics of Big O and Logarithms.
#
#As a programmer first and a mathematician second (or maybe third
#or fourth) I found the best way to understand Big O thoroughly
#was to produce some examples in code. So, below are some common
#orders of growth along with descriptions and examples where
#possible.


#O(1)
#
#O(1) describes an algorithm that will always execute in the same
#time (or space) regardless of the size of the input data set.

def isFirstElementNull(array)
  array[0].nil?
end

#O(N)
#
#O(N) describes an algorithm whose performance will grow linearly
#and in direct proportion to the size of the input data set. The
#example below also demonstrates how Big O favors the worst-case
#performance scenario; a matching string could be found during any
#iteration of the for loop and the function would return early,
#but Big O notation will always assume the upper limit where the
#algorithm will perform the maximum number of iterations.

def containsValue(array, val)
  array.each do |item|
    return true if item == val
  end

  return false
end

#O(N2)
#
#O(N2) represents an algorithm whose performance is directly
#proportional to the square of the size of the input data set. This
#is common with algorithms that involve nested iterations over the
#data set. Deeper nested iterations will result in O(N3), O(N4) etc.

def containsDuplicates(array)
  array.each_with_index do |first_item, first_index|
    array.each_with_index do |second_item. second_index|
      if first_index == second_index
        next
      end

      if first_item == second_item
        return true
      end
    end
  end

  return false
end

#O(2N)
#
#O(2N) denotes an algorithm whose growth will double with each
#additional element in the input data set. The execution time of an
#O(2N) function will quickly become very large.
