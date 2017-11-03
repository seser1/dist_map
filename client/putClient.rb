require 'socket'

port = 49153

sock = TCPSocket.open("localhost",port)

sock.write("put aaa 123")

sock.close