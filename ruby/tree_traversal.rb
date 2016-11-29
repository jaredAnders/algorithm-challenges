class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first_search(search_value)
    return puts self.inspect if @payload == search_value
    @children.each {|child| child.depth_first_search(search_value)}
  end

  def breadth_first_search(val)
    queue = [self]
    while queue.any?
      node = queue.shift
      return puts node.inspect if node.payload == val
      node.children.each {|child| queue.push(child)}
    end
  end

end

deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node = Tree.new(4, [])

sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
ninth_node = Tree.new(9, [fourth_node])

seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

root = Tree.new(2, [seventh_node, shallow_fifth_node])

# find value of 6 in root tree
num = 5
root.depth_first_search(num)
root.breadth_first_search(num)