def double_feature?(flight_length, movie_times)
  check_times(flight_length, movie_times[0], movie_times[1, movie_times.length - 1])
end

def check_times(target, test_case, remaining)
  return false if remaining.empty?

  remaining.each do |movie_time|
    return true if movie_time + test_case == target
  end

  check_times(target, remaining[0], remaining[1, remaining.length - 1])
end

move_length_array = [30, 15, 15, 40, 65, 78]

flight_length = 60

p double_feature?(60, move_length_array)