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
  end

  
  
end
