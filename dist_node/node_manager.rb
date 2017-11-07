require 'socket'
require 'httpclient'
require 'json'

class NodeManager
  port = 49153
    
  #Get(when startup) or update iplist from iphost
  #(This method may have to use http because iplist contains many information and should be handled with xml, json and so on)
  def get_iplist(host_ip)

    =begin
    sock = TCPSocket.open(host_ip,port)

    sock.puts("ip")
    iplist = sock.gets
    p iplist
    sock.close
    
    return iplist
    =end

    http_client = HTTPClient.new(host_ip)
    res = JSON.parse(http_client.get())




  end
  
end
