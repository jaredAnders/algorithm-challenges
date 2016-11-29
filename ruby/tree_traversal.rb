class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first_search(search_value)
    if @payload == search_value
      puts self.inspect
    else
      @children.each do |child|
        child.depth_first_search(search_value)
      end
    end
  end

  def breadth_first_search(val)
    queue = [self]
    puts "initial queue #{queue.inspect}\n\n"

    unless queue.empty?
      queue.each do |node|
        puts "node #{node.payload}\n\n"
        if node.payload == val
          return puts "found node #{node.payload}"
        else
          # puts "queue before push #{queue.each}\n\n"
          node.children.each {|child| queue.push(child)}
          # queue.shift
          # puts "queue after shift #{queue.each}\n\n"
        end
      end
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
# root.depth_first_search(6)

root.breadth_first_search(5)
