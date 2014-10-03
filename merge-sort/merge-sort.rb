#Resources:
#
#https://www.youtube.com/watch?v=EeQ8pwjQxTM

#Merge sort is O(n log n)

#Merge sort does take more space because of the extra arrays or lists
#that it uses to sort but generally speaking the space/time trade off
#is worth it as n log n is about as fast as you can git with sorting
#algorithms

def merge_sort(array)
  #Check if the array is larger than one.  No need to sort if not
  if array.count <= 1
    return array
  end

  mid = array.count / 2

  #recursive call to break input array up into smaller single
  #element arrays that can then be merged back together in a
  #sorted order.
  part_a = merge_sort(array.slice(0, mid))
  part_b = merge_sort(array.slice(mid, array.count - mid))

end

test_array = (1..10000).to_a.shuffle!

merge_sort(test_array)