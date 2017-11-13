require 'socket'

#get host's ip adress from command line
#(in order to get ip informations about other nodes)
host_ip = ARGV[0]
#Port number is fixed
#In future, port number must be shared in project using some procedure
port = 49153
server = TCPServer.open(port)

hash={}

#Move as hash on network
while true
  client = server.accept
  s = client.gets.split
  
  #put([1], [2])
  if s[0]=="put" then
  hash[s[1]] = s[2]
  p hash
  end

  #get([1])  
  if s[0]=="get" then
  client.write(hash[s[1]])
  end

  p hash

  client.close
end

server.close
