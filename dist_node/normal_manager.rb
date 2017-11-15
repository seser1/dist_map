require 'socket'
require 'httpclient'
require 'json'

class NomalManager
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

  def thread
    @client = @server.accept

    allocate(@client.gets.split)

    @client.close
  end


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
