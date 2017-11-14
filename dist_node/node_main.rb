require 'socket'
#require 'node_manager'
require File.dirname(__FILE__) + "/node_manager"

#get host's ip adress from command line
#(in order to get ip informations about other nodes)
host_ip = ARGV[0]
#Port number is fixed
#In future, port number must be shared in project using some procedure

#port = 49153
#server = TCPServer.open(port)

#hash={}
manager = NodeManager.new()

#Move as hash on network
while true
  manager.thread
=begin
  client = server.accept
  s = client.gets.split

  manager.allocate(s)
 
  #put([1], [2])
  if s[0]=="put" then
    hash[s[1]] = s[2]
  end

  #get([1])  
  if s[0]=="get" then
    p hash[s[1]]
    client.write(hash[s[1]])
  end

  p hash

  client.close
=end
end

#server.close
