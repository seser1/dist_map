#Move as hash on network

require File.dirname(__FILE__) + "/node"

#Running argument: ruby main.rb LeaderIPAddress

#Get leader's IP adress from command line
#(In order to get ip informations about other nodes)
leader_ip = ARGV[0]

if leader_ip == nil
  node = Node.new()
else
  node = Node.new(leader_ip)  
end

node.run

