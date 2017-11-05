require 'socket'

class NodeManager
  port = 49153
    
  def get_iplist(host_ip)
    sock = TCPSocket.open(host_ip,port)

    sock.puts("ip")
    iplist = sock.gets
    p iplist
    sock.close
    
    return iplist
  end

  =begin
  def put
    sock = TCPSocket.open("localhost",port)
    sock.write("put aaa 123")
    sock.close
  end
  =end
end
  