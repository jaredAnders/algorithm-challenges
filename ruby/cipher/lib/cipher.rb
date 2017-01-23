class Cipher
  attr_accessor :text, :keyword, :date, :reverse_transpose, :modify_keyword

  def initialize(text, keyword, date)
    @text = text
    @keyword = keyword
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
    # set keys
    dedupe_key = dedupe.join
    mod_key = modify_keyword

    # cut and reorder segments
    segments = assign_to_char(dedupe_key, cut_segments(mod_key))
    segments = reorder_segments(mod_key, segments)

    # reverse transposition, combine into one string and remove trailing X's
    output = segments.transpose.join('')
    output.chop! while output.end_with? 'X'
    output
  end

  def dedupe
    new_array = []
    array = keyword.split('')
    array.each_with_index do |e, i|
      new_array << e unless array.index(e) != i
    end
    new_array
  end

  def modify_keyword
    dedupe.sort.join
  end

  def cut_segments(mod_key)
    cut_length = text.length / mod_key.length
    text.scan(/.{#{cut_length}}/)
  end

  def assign_to_char(dedupe_key, cuts)
    hash = {}
    dedupe_key.split('').each_with_index do |key_char, i|
      hash[key_char.to_sym] = cuts[i]
    end
    hash
  end

  def reorder_segments(mod_key, segments)
    array = []
    mod_key.split('').each do |key_char|
      array << segments[key_char.to_sym].split('')
    end
    array
  end
end
