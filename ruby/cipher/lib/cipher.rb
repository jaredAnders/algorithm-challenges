class Cipher
  attr_accessor :key, :decrypt

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def decrypt
    order_keyword
  end

  def order_keyword
    new_array = []
    array = key.split('')
    array.each_with_index do |e, i|
      new_array << e unless array.index(e) != i
    end
    new_array.sort.join
  end
end
