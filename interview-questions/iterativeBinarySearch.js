
function bSearch(serachValue, set) {
  var low = 0
  var high = set.length - 1
  while(low <= high) {
    var mid = Math.floor((low + high) / 2)
    if (serachValue < set[mid])
      high = mid - 1
    else if (set[mid] < serachValue)
      low = mid + 1
    else
      return mid
  }
  return -1
}

var numbers = [2, 4, 6, 8, 9, 10, 14, 27, 45]

console.log(bSearch(6, numbers) === 2)
console.log(bSearch(7, numbers) === -1)