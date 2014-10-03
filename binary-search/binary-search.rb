def binary_search(array, value, from=0, to=nil)
  if to == nil
    to = array.count - 1
  end

  mid = (from + to) / 2

  if value < array[mid]
    return binary_search(array, value, from, mid - 1)
  elsif value > array[mid]
    return binary_search(array, value, mid + 1, to)
  else
    return mid
  end
end

test_array = (1..6000).to_a

result_index = binary_search(test_array, 3500)

puts "You searched for 3500"
puts "It is at index #{result_index}"
puts test_array[result_index]