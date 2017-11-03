require 'socket'

port = 49153
server = TCPServer.open(port)

hash={}

while true
  client = server.accept
  s = client.gets.split
  
  if s[0]=="put" then
  hash[s[1]] = s[2]
  end
  
  if s[0]=="get" then
  client.write(hash[s[1]])
  end

  p hash

  client.close
end

server.close
