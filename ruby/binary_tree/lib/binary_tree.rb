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
      compare(tree, element)
    end
    tree
  end

  def self.compare(node, element)
    if element < node.payload
      node.left ? compare(node.left, element) : node.left = BinaryTree.new(element)
    else
      node.right ? compare(node.right, element) : node.right = BinaryTree.new(element)
    end
  end

  def sort(sorted_array = [])
    if left.nil?
      sorted_array << payload
      right.sort(sorted_array) unless right.nil?
    else
      left.sort(sorted_array)
      self.left = nil
      sort(sorted_array)
    end
    sorted_array
  end
end
