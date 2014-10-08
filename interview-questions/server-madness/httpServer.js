var http = require('http')
var net = require('net')

var sockets = []

var tcp = net.createServer(function(socket) {
  socket.write('Hello')
  sockets.push(socket)

  socket.on('end', function(data) {
    var index = sockets.indexOf(socket)
    sockets.splice(index, 1)
  })
})

tcp.listen(8001)

var server = http.createServer(function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'})
  res.write('Hello\n')
  console.log('Hello\n')

  var socket = sockets.shift()

  if (socket) {
    socket.on('data', function(data) {
      res.write(data)
    })

    socket.on('end', function(data) {
      res.end('DONE')
    })
  } else {
    res.end('hello no sockets')    
  }

});

server.listen(5000)