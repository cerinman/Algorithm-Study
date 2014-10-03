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
end