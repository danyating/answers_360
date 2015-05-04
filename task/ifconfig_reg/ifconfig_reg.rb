
h = Hash.new

key = ''
value = ''

#将ifconfig的输出流按行读入到val中存储
#判断：主要根据字符串匹配
while !$stdin.eof
 val = $stdin.gets.chomp()
 #找出网卡名称，网卡名称都是顶头写的，没有tab键和空格键
 if !(val =~ /\t.*/)
   /(.*:).*/ =~ val
   key = $1
 end

 #找出有ip的网卡的ip地址，有ip的ip前有“net”。并将匹配的网卡及ip存入到哈希表中
 if val =~ /.*inet.*/
   /(.*inet)(.*)(net.*)/ =~ val
   if $2 != nil
     value = $2
     h[key] = value
   end
 end
end

#将哈希表输出到命令行
p h