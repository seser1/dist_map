require File.dirname(__FILE__) + "/normal_manager"
require File.dirname(__FILE__) + "/leader_manager"

class Node
    
    def initialize(ip)
      $leader_ip = ip
  
      #server.close is may not needed because it will be closed
      #when the class instance be garvage collected.
      #(is it really true????)
      @server = TCPServer.open($port)

      @manager = nomal_manager.new(leader_ip)
      #@manager = leader_manager.new(leader_ip)
      
      @hash={}
      @iplist={}    
    end
  
end
  