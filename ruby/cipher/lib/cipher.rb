class Cipher
  attr_accessor :text, :key, :date, :reverse_transpose

  def initialize(text, key, date)
    @text = text
    @key = key
    @date = date
  end

  # def decrypt
  #   modify_keyword
  # end

  # def caesar
  #
  # end
  #

  def reverse_transpose
    dedupe_key = dedupe.join
    mod_key = modify_keyword
    cut_length = text.length / mod_key.length
    cuts = text.scan(/.{#{cut_length}}/)

    hash = {}
    dedupe_key.split('').each_with_index do |key_char, i|
      hash[key_char.to_sym] = cuts[i]
    end

    cuts = []
    mod_key.split('').each do |key_char|
      cuts << hash[key_char.to_sym].split('')
    end

    reversed_text = cuts.transpose.join('')

    # binding.pry

    reversed_text.chop! while reversed_text.end_with? 'X'

    reversed_text
  end

  def modify_keyword
    dedupe.sort.join
  end

  def dedupe
    new_array = []
    array = key.split('')
    array.each_with_index do |e, i|
      new_array << e unless array.index(e) != i
    end
    new_array
  end
end
