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

  new_array = []
  offset_a = 0
  offset_b = 0

  #Merge the smaller arrays together by comparing the first
  #element and pushing the smaller of the two to the new
  #array
  while offset_a < part_a.count && offset_b < part_b.count
    a = part_a[offset_a]
    b = part_b[offset_b]

    if a <= b
      new_array << a
      offset_a += 1
    else
      new_array << b
      offset_b += 1
    end
  end

  #There might be left over item that has not been pushed in
  #either part_a or part_b.  This handles that case.
  while offset_a < part_a.count
    new_array << part_a[offset_a]
    offset_a += 1
  end

  while offset_b < part_b.count
    new_array << part_b[offset_b]
    offset_b += 1
  end

  return new_array
end

test_array = (1..1000).to_a.shuffle!

puts "Here is the shuffled array"
p test_array
puts "Here is the sorted array"
p merge_sort(test_array)