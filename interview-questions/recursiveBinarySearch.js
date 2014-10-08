
function bSearch(set, serachValue, low, high) {
  if (high < low)
    return -1
  var mid = Math.floor((low + high) / 2)
  if (set[mid] > serachValue) {
    return bSearch(set, serachValue, low, mid - 1) 
  } else if (set[mid] < serachValue) {
    return bSearch(set, serachValue, mid + 1, high)
  } else {
    return mid
  }
}

var numbers = [2, 4, 6, 8, 9, 10, 14, 27, 45]

console.log(bSearch(numbers, 6, 0, numbers.length -1) === 2 )
console.log(bSearch(numbers, 7, 0, numbers.length -1) === -1 )

