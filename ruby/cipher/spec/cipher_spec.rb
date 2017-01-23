require 'spec_helper'

RSpec.describe Cipher, type: :model do
  describe '#decrypt' do
    let(:text) { '1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE' }
    let(:keyword) { 'CEILING' }
    let(:date) { 17 }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'decrypts message' do
      expected = 'IMPORTANTINFORMATIONCOMINGOVERNEXT4DAYS'
      expect(input.decrypt).to eq expected
    end
  end

  describe '#reverse_caesar' do
    let(:text) { 'Q44N7YGSQRW' }
    let(:keyword) { 'GREYHOUND' }
    let(:date) { 17 }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'reverses caesar cipher' do
      expected = 'ALLYOURBASE'
      expect(input.reverse_caesar).to eq expected
    end
  end

  describe '#reverse_transposition' do
    let(:text) { 'ASTOTSVALNINDCXNMOUIHIROXYOWROMPGYA' }
    let(:keyword) { 'FOXHOUND' }
    let(:date) { 17 }
    let(:input) { Cipher.new(text, keyword, date) }
    it 'reverses columnal transposition' do
      expected = 'MANYSHIPSMOVINGTOWARDYOURLOCATION'
      expect(input.reverse_transposition).to eq expected
    end
  end
end
