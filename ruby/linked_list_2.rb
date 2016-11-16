class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def reverse_list(list, prev_node=nil)
  revList = nil
    while list != nil
      revList = LinkedListNode.new(list.value, revList)
      list = list.next_node
    end
  return revList
end

def rev_list(list, prev_node=nil)
  if list.nil?
    return prev_node
  else
    next_node = list.next_node
    list.next_node = prev_node
    rev_list(next_node, list)
  end
end


def check_infinite(list)
  leading_node = list
  trailing_node = list

  while leading_node != nil
    return 'no loop' if leading_node.next_node == nil
    leading_node = leading_node.next_node

    return 'no loop' if leading_node.next_node == nil
    leading_node = leading_node.next_node
    trailing_node = trailing_node.next_node

    return 'infinite loop' if leading_node == trailing_node
  end

end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

## initialize test list
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

## make list infinite
# node1.next_node = node3

## print testing results

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)

puts "-------"

revlist2 = rev_list(node3)
print_values(revlist2)

# print check_infinite(node3)
