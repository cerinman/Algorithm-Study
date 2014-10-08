function compile(name, callback) {
  setTimeout(function() {
    callback(name)
  }, 3000)
}

function notify(name) {
  console.log(name)
}

compile("John", notify)