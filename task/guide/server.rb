#定义好的信息用散列表存储，这里用data变量存储
require "socket"
data = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}

#建立TCP连接
server = TCPServer.new(2000)
p data
p data["a"]
#循环监测
loop do
  client = server.accept
  #info存储客户端发过来的查询数据
  info = client.gets

  #检查是否有该数据信息，有则返回数据结果，否则提示查询信息不存在
  if data.include?(info.chop)
    client.puts(data[info.chop])
  else
    client.puts "The information of #{info.chop} doesn't exist."
  end
  client.close
end