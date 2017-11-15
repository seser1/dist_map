require File.dirname(__FILE__) + "/node_manager"

class Node
    
    def initialize(ip)
      $leader_ip = ip
  
      #server.close is may not needed because it will be closed
      #when the class instance be garvage collected.
      #(is it really true????)
      @server = TCPServer.open($port)
  
      @hash={}
      @iplist={}    
    end
  
end
  