def iterative_sum(array)
  sum = 0
  array.each do |element|
    if element.instance_of? String
      element.split("").each do |character|
        num = character.ord
        num = num > 96 ? num - 96 : num - 38
        num = num < 1 ? 0 : num
        sum += num
      end
    else
      sum += element
    end
  end
  sum
end

def recursive_sum(array, sum = 0)
  return sum if array.empty?
  element = array.shift
  if element.instance_of? String
    element.split("").each do |character|
      num = character.ord
      num = num > 96 ? num - 96 : num - 38
      num = num < 1 ? 0 : num
      sum += num
    end
  else
    sum += element
  end
  recursive_sum(array, sum)
end

value_array = [1, 'all', 4, 53, 'Cats', 24, 'Bilbo Swaggins', 12, 74, 'Wowwie', 23, 60, 13, 46, 'That is amazing']

puts iterative_sum(value_array)
puts recursive_sum(value_array)
