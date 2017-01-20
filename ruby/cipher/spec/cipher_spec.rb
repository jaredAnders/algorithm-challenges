require 'spec_helper'

RSpec.describe Cipher, type: :model do
  describe '#decrypt' do
    it 'returns key' do
      message = "1T7766T56C6ZXB71T7NIXC6I5XMXIY11CWX8I5V7AE"
      key = "CEILING"
      date = 17
      test = Cipher.new(message, key, date)
      expect(test.order_keyword).to eq "CEGILN"
    end
  end
end
