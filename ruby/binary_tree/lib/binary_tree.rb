class BinaryTree
  attr_accessor :payload, :left, :right, :build, :sort

  def initialize(payload = nil, left = nil, right = nil)
    @payload = payload
    @left = left
    @right = right
  end

  def self.build(array)
    tree = BinaryTree.new(array.shift)
    array.each do |element|
      compare_node(tree, element)
    end
    tree
  end

  def self.compare_node(current_node, element)
    if element < current_node.payload
      if current_node.left.nil?
        current_node.left = BinaryTree.new(element)
      else
        compare_node(current_node.left, element)
      end
    elsif element > current_node.payload
      if current_node.right.nil?
        current_node.right = BinaryTree.new(element)
      else
        compare_node(current_node.right, element)
      end
    end
  end

  def sort(sorted_array = [])
    if self.left.nil?
      sorted_array << self.payload
      self.right.sort(sorted_array) unless self.right.nil?
    else
      self.left.sort(sorted_array)
      self.left = nil
      self.sort(sorted_array)
    end
    sorted_array
  end
end
