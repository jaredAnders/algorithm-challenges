require_relative 'cipher'

puts 'Enter text:'
text = gets.chomp.upcase
puts 'Enter keyword:'
keyword = gets.chomp.upcase
puts 'Enter day of month as integer:'
date = gets.chomp.to_i

input = Cipher.new(text, keyword, date)
puts "Decrypted message: #{input.decrypt}"
