require 'socket'

port = 49153

server = TCPServer.open(port)

while true
  client = server.accept
  p client
  client.puts "test"
  client.close
end