class BinaryTree
  attr_accessor :payload, :left, :right, :build_tree

  def initialize(payload = nil, left = nil, right = nil)
    @payload = payload
    @left = left
    @right = right
  end

  def build_tree(array)
    tree = []
    array.each_with_index do |element, index|
      if index == 0
        tree.push(BinaryTree.new(array[0]))
      else
        current_node = tree[0]
        compare_node(current_node, element)
      end
    end
    tree
  end

  def compare_node(current_node, element)
    if element < current_node.payload
      if current_node.left == nil
        current_node.left = BinaryTree.new(element)
      else compare_node(current_node.left, element)
      end
    elsif element > current_node.payload
      if current_node.right == nil
        current_node.right = BinaryTree.new(element)
      else compare_node(current_node.right, element)
      end
    end
  end



end

# array = [7, 4, 9, 1, 6, 14, 10]
# tree = BinaryTree.new.build_tree(array)
