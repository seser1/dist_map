require 'socket'
require 'httpclient'
require 'json'

class NomalManager
    def initialize(l_ip)
    @hash= {}
    @iplist= []
  
    #Port number is fixed
    #In future, port number must be shared in project using some procedure
    $port = 49153

    #IP adress of leader node
    $leader_ip = l_ip
    
    #Start to wait as a server
    #server.close may not be needed because it will be closed
    #when the class instance be garvage collected.
    #(is it really true????)
    @server = TCPServer.open($port)
    
    #Register ip address of this node to leader node
    #After registing, leader node distributes iplist to all node.
    #So this method must be executed after setting up the @server
    regist_ip()
  end

  #Executed in node.rb
  def thread
    @client = @server.accept

    allocate(@client.gets.split)

    @client.close
  end
  
  def allocate(s)
    case s[0]
    when "put" then
      this_put(s[1], s[2])
    when "get" then
      this_get(s[1])
    when "iplist" then
      update_iplist(s)
    end
  end
  
  def this_put(key, value)
    node_ip = get_node_ip(key)
    if node_ip == $this_ip then
      #This node has the value
      @hash[key] = value
    else
      #Other node has the value
      net_put(node_ip, key, value)
    end
  end

  def net_put(node_ip, key, value)
    sock = TCPSocket.open(node_ip ,$port)
    sock.write("put " + key + " " + value)
    sock.close
  end

  def this_get(key)
    node_ip = get_node_ip(key)
    if node_ip == $this_ip then
      #This node has the value
      if @hash[key] != nil
        @client.write(@hash[key])
      else
        #Tshi action is to debug: in future, return nil
        @client.write("No value exists in target node.")
      end
    else
      #Other node has the value
      @client.write(net_get(node_ip, key))
    end
  end

  def net_get(node_ip, key)
    sock = TCPSocket.open(node_ip ,$port)
    sock.write("get " + key)
    s = sock.gets
    sock.close
    return s
  end

  #Get node's IP address from key
  def get_node_ip(key)
    return @iplist[get_hash(key, @iplist.size)]
  end

  #Get str's hash number
  def get_hash(str, elem_num)
    tmp = 0
    s = str.unpack("C*")
    for i in 1..s.size
      tmp += s[i-1]
    end
    return tmp % elem_num
  end

  #Run when iplist is updated (triggerd by request from leader server)
  #F(Future work) get new iplist , reculclate and remap the hash map
  def update_iplist(s)
    @iplist = s.delete("iplist")
  end

  #Register this node's ip address to leader node
  #This method is called only one time (in initialize)
  #This method returns ip address of this node
  def regist_ip
    sock = TCPSocket.open($leader_ip)
    sock.write("regist")
    ret_ip = sock.gets
    sock.close
    return ret_ip
  end

  #Get(in initialize) or update iplist from leader
  def get_iplist()
    sock = TCPSocket.open($leader_ip, $port)
    sock.write("get_iplist")
    @iplist = (sock.read).split(' ')
    sock.close
  end
end
