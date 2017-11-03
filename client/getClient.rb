require 'socket'

port = 49153

sock = TCPSocket.open("localhost",port)

sock.puts("get aaa")
p sock.gets

sock.close