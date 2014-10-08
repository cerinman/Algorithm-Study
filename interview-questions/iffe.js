(function() {
  console.log(1)
  setTimeout(function(){console.log(2)}, 0)
  setTimeout(function(){console.log(3)}, 0)
  console.log(4)
})()

(function() {
  console.log(1)
  setTimeout(function(){console.log(2)}, 100)
  setTimeout(function(){console.log(3)}, 0)
  console.log(4)
})()