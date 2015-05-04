#创建节点类
class Node
  attr_accessor :nameId      #索引，同索引的节点视为同一节点
  attr_accessor :val         #节点内容
  attr_accessor :parent      #节点的父节点
  attr_accessor :childHash   #节点的直接子节点，以哈希表形式存储，key为子节点的索引，value
                             #为子节点对象
  #初始化函数
  def initialize(nameId, val)
    @nameId = nameId
    @parent = nil
    @val = val
    @childHash = Hash.new
  end
end

#创建树类
class Tree
  attr_accessor :root             #根节点对象
  attr_accessor :nodeHash         #所有子节点，以哈希表形式存储

  #初始化函数
  def initialize()
    @root = nil
    @nodeHash = Hash.new
  end


  #添加节点
  def add(parent, child)
    #若想添加已添加的根节点、子节点等，提示参数错误
    raise ArgumentError, "Root node exists" \
      if parent.nil? && @nodeHash.nil?
    raise ArgumentError, "#Child {child.nameId} already added" \
      if @nodeHash.include?(child.nameId)
    if @nodeHash.nil? == false && parent.nil? == false
      raise ArgumentError, "Parent node doesn't exist"  \
        if @nodeHash.include?(parent.nameId) == false
    end

    if parent.nil? && @nodeHash.nil? == false           #若该树为空，则插入节点为根节点
       @nodeHash[child.nameId] = child
       root = child
       return
    elsif
      child.parent = parent
      parent.childHash[child.nameId] = child  #父节点对象的子节点哈希表更新
      @nodeHash[child.nameId] = child         #存储子节点的哈希表更新
    end
  end

  #递归函数，获取node节点的直接子节点，递归获取所有子节点
  def getDirectChild(node, childAll)
    if node.childHash.nil?      #递归结束条件，
      return
    end

    node.childHash.each_value do |val|  #遍历node的直接子节点，并存储在childAll中
      childAll.push(val)
      getDirectChild(val, childAll)
    end

  end

  #获取节点的所有子节点，调用上面的递归函数
  def get(node)
    raise AgumentError, "Node can't be nil" if node.nil?
    childAll = []                   #存储所有的子节点
    getDirectChild(node, childAll)
    return childAll
  end

  private :getDirectChild

end



#测试
=begin
n1 = Node.new("a", 5)
n2 = Node.new("b", 5)
n3 = Node.new("c", "5")
n4 = Node.new("d", 6)
n5 = Node.new("e", 6)
n6 = Node.new("f", 6)

a = Tree.new()

a.add(nil, n1)
a.add(n1, n2)
a.add(n2, n3)
a.add(n3, n4)
a.add(n2, n5)
a.add(n2, n6)
b = a.get(n1)

b.each_with_index do |val|
  p val.nameId
end


a.get(n2)

n2.childHash.each_value do |val|
  p val
end
=end