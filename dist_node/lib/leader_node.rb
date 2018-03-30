require File.dirname(__FILE__) + "/normal_node"

class LeaderNode < NormalNode
  def initialize()    
    #Port number is fixed
    #In future, port number must be shared in project using some procedure
    $port = 49153

    #server.close is may not needed because it will be closed
    #when the class instance be garvage collected.
    #(is it really true????)
    @server = TCPServer.open($port)

    @hash={}
    @iplist=[]
  end  

  def allocate(s)
    case s[0]
    when "put" then
      this_put(s[1], s[2])
    when "get" then
      this_get(s[1])
    when "get_iplist" then
      ret_iplist()
    when "regist" then
      regist_node()
    end
  end

  #Disributing iplist to all nodes
  def distribute_iplist
    puts 'Distributing iplist'    

    s = "iplist " + iplist.join(' ')
    for ip in iplist
      sock = TCPSocket.open(ip ,$port)
      sock.write(s)
      sock.close
    end
  end

  #Register a new node (using @client defined in nomal_node.thread)
  #After registing, notice new iplist to all nodes  
  def regist_node
    puts 'Registering new node'
    
    new_ip = @client.peeraddr[3]
    iplist.push(new_ip)
    distribute_iplist()
  end
end  