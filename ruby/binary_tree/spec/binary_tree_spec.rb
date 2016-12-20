require 'spec_helper'

RSpec.describe BinaryTree, type: :model do
  describe 'sort_tree' do
    it "should return sorted array" do
      expected = [1, 4, 6, 7, 9, 10, 14]
      array = [7, 4, 9, 1, 6, 14, 10]
      expect(BinaryTree.sort_tree(array)).to eq expected
    end
  end
end
