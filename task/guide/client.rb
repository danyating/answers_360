#该程序适用于本地通信，若网络通信需将hostname改为通信的IP地址
require "socket"

hostname = "127.0.0.1"
port = 2000

s = TCPSocket.new(hostname, port)

#测试数据
key = "f"
s.puts key

while line = s.gets
  puts line.chop
end

s.close


