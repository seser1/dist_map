#Move as hash on network

require 'socket'
require File.dirname(__FILE__) + "/node"

#get host's ip adress from command line
#(in order to get ip informations about other nodes)
leader_ip = ARGV[0]

manager = NodeManager.new(leader_ip)

while true
  manager.thread
end
