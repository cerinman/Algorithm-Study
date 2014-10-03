# Resources:

#https://www.youtube.com/watch?v=8Kp-8OGwphY

#Bubble sort is O(n 2)

#Bubble sort works by comparing each item in a set to its
#immediate right neighbor and swapping them if they are not
#in order.  This happens continually until no swaps have
#been made on a single pass and the dataset is completely
#sorted.

def bubble_sort(array)
  return array if array.size <= 1 #No need to sort an empty or single element array

  swapped = true #We have to have a flag to check if array is sorted.

  while swapped do
    swapped = false
    0.upto(array.size - 2) do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i] #swap positions
        swapped = true
      end
    end
  end
end

test_array = (1..1000).to_a.shuffle!

puts "Here is the unsorted array"
p test_array
puts "Here is the sorted array"
bubble_sort(test_array)
p test_array