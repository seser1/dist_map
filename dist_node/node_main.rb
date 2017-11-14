#Move as hash on network

require 'socket'
require File.dirname(__FILE__) + "/node_manager"

#get host's ip adress from command line
#(in order to get ip informations about other nodes)
host_ip = ARGV[0]

manager = NodeManager.new(host_ip)

while true
  manager.thread
end
