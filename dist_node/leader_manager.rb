require File.dirname(__FILE__) + "/normal_manager"

class LeaderManager < NormalManager
  def initialize(ip)
    #Port number is fixed
    #In future, port number must be shared in project using some procedure
    $port = 49153

    #IP adress of leader node
    $leader_ip = ip

    #server.close is may not needed because it will be closed
    #when the class instance be garvage collected.
    #(is it really true????)
    @server = TCPServer.open($port)

    @hash={}
    @iplist={}    
  end  
end  