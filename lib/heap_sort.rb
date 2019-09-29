require_relative "min_heap"
# require 'pry'

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn),where n is the number of items in the list, 
# because the add and remove methods are O(nlogn)
# Space Complexity: O(2n), where n is the number of items in the list
def heapsort(list)
  return list if list.length < 2

  heap = MinHeap.new

  i = 0
  list.each do
    heap.add(list[i])
    i += 1
  end

  i = 0
  until i == list.length
    list[i] = heap.remove
    i += 1
  end

  return list
end
