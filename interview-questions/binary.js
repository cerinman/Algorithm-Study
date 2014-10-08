function search(x, list) {
  if (list.length === 0) {
    return false
  }

  var index = Math.floor(list.length / 2)
  var val = list[index]

  if (val === x) {
    return index
  } else if ( x > val) {
    return search(val, list.slice(index))
  } else {
    return search(val, list.slice(0, index))
  }
}

console.log( search(5, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
