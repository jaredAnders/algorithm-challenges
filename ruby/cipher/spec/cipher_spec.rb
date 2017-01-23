require 'spec_helper'

RSpec.describe Cipher, type: :model do
  let(:text) { 'ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA' }
  let(:keyword) { 'FOXHOUND' }
  let(:date) { 17 }
  let(:input) { Cipher.new(text, keyword, date) }

  describe '#reverse_transpose' do
    it 'reverses columnal transposition' do
      expected = 'MANYSHIPSMOVINGTOWARDYOURLOCATION'
      expect(input.reverse_transpose).to eq expected
    end
  end

  describe '#modify_keyword' do
    it 'dedupes and reorders alphabetically' do
      expect(input.modify_keyword).to eq 'DFHNOUX'
    end
  end
end
