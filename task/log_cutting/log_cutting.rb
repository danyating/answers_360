#该切割采用重命名方式，利用crontab每天定时执行该脚本
require 'date'
require 'fileutils'

#日志最大存取条数
@max_num = 1000
@array = []
a = DateTime.now
p a

#实际使用时可能需要修改具体路径
File.rename("/var/log/access.log", "/var/log/access_#{a}.log")

d = Dir.new("/var/log/")
@num = 0

#记录该目录下access的日志数
d.each do |x|
  p x
  if(x =~ /access.*/)
    @array[@num] = x
    @num = @num + 1
  end

end

#日志数超过1000，将最早的一条删掉
if(@num >= @max_num)
  FileUtils.remove_file(@array[0], true)
  p @array[0]
end
