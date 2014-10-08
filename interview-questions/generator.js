function *fibsGenerator() {
  var knownFibs = []
  while(true) {
    if (knownFibs.length < 2) knownFibs.push(1)
    else knownFibs.push(knownFibs[knownFibs.length-1] + knownFibs[knownFibs.length-2])
    yield knownFibs[knownFibs.length - 1]
  }
}

function printFibs(num) {
  var generator = fibsGenerator()
  var currentFib = generator.next().value
  while(currentFib < num) {
    console.log(currentFib)
    currentFib = generator.next().value
  }
}

printFibs(30)asdf