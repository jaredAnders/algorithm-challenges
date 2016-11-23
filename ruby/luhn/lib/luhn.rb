module Luhn
  def self.is_valid?(number)
    array = number.to_s.split(//)
    sum = 0
    array.reverse.each_with_index do |value, i|
      value = value.to_i
      value *= 2 if (i + 1) % 2 == 0
      value -= 9 if value > 9
      sum += value
    end
    sum % 10 == 0 ? true : false
  end
end
