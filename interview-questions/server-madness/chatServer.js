var net = require('net')

var people = []
var server = net.createServer(function(socket) {
  people.push(socket)

  socket.on('data', function(data) {
    people.forEach(function(peep) {
      peep.write(socket.remoteAddress + '*')
      peep.write(data)
    })
  })

  socket.on('end', function(data) {
    var index = people.indexOf(socket)
    people.splice(index, 1)
  })
})

server.listen(4000)