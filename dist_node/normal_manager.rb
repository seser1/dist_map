require 'socket'
require 'httpclient'
require 'json'
require 'digest/md5'

class NomalManager
    def initialize(ip)
    #Port number is fixed
    #In future, port number must be shared in project using some procedure
    $port = 49153

    #IP adress of leader node
    $leader_ip = ip
    #IP adress of this node
    $this_ip

    #server.close is may not needed because it will be closed
    #when the class instance be garvage collected.
    #(is it really true????)
    @server = TCPServer.open($port)

    @hash= {}
    @iplist= []
  end

  def thread
    @client = @server.accept

    allocate(@client.gets.split)

    @client.close
  end
  
  def allocate(s)
    if s[0]=="put" then
      this_put(s[1], s[2])
    end
  end
  
  def this_put(key, value)
    node_ip = get_node_ip(key)
    if(node_ip == $this_ip)
      #This node has the value
      @hash[key] = value
    else
      #Other node has the value
      net_put(node_ip, key, value)
    end
  end

  def net_put(node_ip, key, value)
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

=begin
Old version of allocate
  def allocate(s)
      #put([1], [2])
    if s[0]=="put" then
      @hash[s[1]] = s[2]
    end
 
    #get([1])  
    if s[0]=="get" then
      #p @hash[s[1]]
      @client.write(@hash[s[1]])
    end

  p @hash
  end
=end

  #run when iplist is updated (triggerd by request from leader server)
  #get new iplist , reculclate and remap the hash map
  def update
  end

  #Get(when startup) or update iplist from leader
  def get_iplist()
    #http_client = HTTPClient.new(leader_ip)
    #@iplist = JSON.parse(http_client.get())
    sock = TCPSocket.open($leader_ip, $port)
    sock.write("iplist")
    @iplist = sock.read
    #How to manage iplist must be considered
    sock.close
  end
  
end
