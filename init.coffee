connect = require('connect')
io = require('socket.io')

server = connect.createServer(
  connect.favicon()
  , connect.logger()
  , connect.static(__dirname + '/public')
)
server.listen(8000)

socket = io.listen(server)
socket.on 'connection', (socket) ->
  socket.send({ hello: 'world' })
