#Resources:

#https://www.youtube.com/watch?v=aQiWF4E8flQ

#Quick sort is O(n 2) at worst but for some datasets it can
#actually behave more like O(n log n).  This is typically
#because of the size of the dataset.  The smaller the dataset
#the better Quick sort will perform.  It is also worth noting
#that quick sort does much better if the first pivot chosen
#for comparison is some where in the median of the array.
#
#Quick sort works in place

def quick_sort(array, from = 0, to = nil)

  #By default we start by sorting the entire
  #array.
  if to == nil
    to = array.count - 1
  end

  #Because this sort is in place, we don't need
  #to return anything.  This is the guard check
  #for sorting being complete.
  if from >= to
    return
  end

  #Quick sort uses the key word 'pivot' to indicate
  #the current array element being used to compare.
  #It starts at the far left of the array.
  pivot = array[from]

  #Min and Max pointers to be used in algorithm
  min = from
  max = to

  #Free represents the current free slot in the array
  #or wall that is used to separate the sorted part
  #of the array from the unsorted part.
  free = min

  while min < max
    if free == min #Evaluate array[max]
      if array[max] <= pivot #Smaller than pivot must move
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max #Evaluate array[min]
      if array[min] >= pivot #Bigger than pivot must move
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    else
      raise "Inconsistent State"
    end
  end

  array[free] = pivot

  quick_sort(array, from, free - 1)
  quick_sort(array, free + 1, to)
end

test_array = (1..1000).to_a.shuffle
puts "Here is the unsorted array"
p test_array
puts "here is the sorted array"
quick_sort(test_array)
p test_array