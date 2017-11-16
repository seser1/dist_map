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

  def allocate(s)
    if s[0]=="put" then
      this_put(s[1], s[2])
    elsif s[0] == "get" then
        this_get(s[1])
    elsif s[0] == "get_iplist" then
        ret_iplist()
    end
  end

  def ret_iplist
  end
end  