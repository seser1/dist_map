require File.dirname(__FILE__) + "/normal_manager"

class LeaderManager < NormalManager
  def initialize()
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
    @iplist=[]
  end  

  def allocate(s)
    if s[0]=="put" then
      this_put(s[1], s[2])
    elsif s[0] == "get" then
        this_get(s[1])
    elsif s[0] == "get_iplist" then
        ret_iplist()
    elsif s[0] == "regist" then
        regist_node()
    end
  end

  #Disributing iplist to all nodes
  def distribute_iplist
    s = "iplist " + iplist.join(' ')
    for ip in iplist
      sock = TCPSocket.open(ip ,$port)
      sock.write(s)
      sock.close
    end
  end

  #Register a new node (using @client defined in nomal_manager.thread)
  #After registing, notice new iplist to all nodes  
  def regist_node
    new_ip = @client.peeraddr[3]
    iplist.push(new_ip)
    distribute_iplist()
  end
end  