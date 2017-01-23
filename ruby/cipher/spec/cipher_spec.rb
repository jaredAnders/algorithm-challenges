require 'spec_helper'

RSpec.describe Cipher, type: :model do
  let(:date) { 17 }
  describe '#reverse_caesar' do
    let(:text) { 'ALL YOUR BASE' }
    let(:keyword) { 'GREYHOUND' }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'reverses caesar cipher' do
      expected = 'QSTVWXZ0123456789GREYHOUNDABCFIJKLMP'
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

  describe '#modify_keyword' do
    let(:text) { '1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE' }
    let(:keyword) { 'CEILING' }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'dedupes and reorders characters alphabetically' do
      expect(input.modify_keyword).to eq 'CEGILN'
    end
  end
end
