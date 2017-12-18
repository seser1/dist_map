require 'socket'

#Client for dist_map

#Get leader's IP adress from command line in order to connect
$leader_ip = ARGV[0]
$port = 49153

def run(s)
  begin
    puts 'Connecting..'
    sock = TCPSocket.open($leader_ip ,$port)
  rescue
    puts 'faild to connect leader node'
    return
  end
  if s[0] == 'put'
    sock.write("put #{s[1]} #{s[2]}")
  elsif s[0] == 'get'
    sock.puts("get #{s[1]}")
    val = sock.gets
    puts "get val: #{val}"
  end

  puts "#{s[0]} finished"
  sock.close
end

while true
  s = gets.chomp.split(" ")
  break if s[0] == 'exit'
  run(s)
end

