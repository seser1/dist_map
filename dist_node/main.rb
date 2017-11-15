#Move as hash on network

require File.dirname(__FILE__) + "/node"

#get host's ip adress from command line
#(in order to get ip informations about other nodes)
leader_ip = ARGV[0]

node = Node.new(leader_ip)

node.run

