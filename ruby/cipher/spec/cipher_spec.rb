require 'spec_helper'

RSpec.describe Cipher, type: :model do
  let(:date) { 17 }
  describe '#reverse_caesar' do
    let(:text) { 'Q44N7YGSQRW' }
    let(:keyword) { 'GREYHOUND' }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'reverses caesar cipher' do
      expected = 'ALLYOURBASE'
      expect(input.reverse_caesar).to eq expected
    end
  end

  describe '#reverse_transposition' do
    let(:text) { 'ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA' }
    let(:keyword) { 'FOXHOUND' }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'reverses columnal transposition' do
      expected = 'MANYSHIPSMOVINGTOWARDYOURLOCATION'
      expect(input.reverse_transposition).to eq expected
    end
  end
end
