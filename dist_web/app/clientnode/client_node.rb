require 'socket'

class ClientNode
  port = 49153
    
  def get
    sock = TCPSocket.open("localhost",port)
    
    sock.puts("get aaa")
    p sock.gets

    sock.close
  end

  def put
    sock = TCPSocket.open("localhost",port)
    sock.write("put aaa 123")
    sock.close
  end
end
  