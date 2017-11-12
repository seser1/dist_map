require 'socket'
require 'httpclient'
require 'json'

class NodeManager
  port = 49153
  @@iplist
    
  #Get(when startup) or update iplist from iphost
  def get_iplist(host_ip)

    http_client = HTTPClient.new(host_ip)
    iplist = JSON.parse(http_client.get())

    =begin
    sock = TCPSocket.open(host_ip,port)

    sock.puts("ip")
    iplist = sock.gets
    p iplist
    sock.close
    
    return iplist
    =end

  end
  
end
