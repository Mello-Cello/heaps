class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    index = @store.length-1
    heap_up(index)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return nil if empty?
    swap(0, @store.length-1)
    removed_item = @store.pop
    heap_down(0)
    return removed_item.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    return if index == 0
    parent_index = find_parent_index(index)
    if @store[parent_index].key > @store[index].key
      swap(parent_index, index)
      heap_up(parent_index)
    end
    return
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(parent_index)
    left_child_index = find_left_child_index(parent_index)
    right_child_index = find_right_child_index(parent_index)

    return if !@store[left_child_index]

    if !@store[right_child_index] || @store[left_child_index].key < @store[right_child_index].key
      swap(left_child_index, parent_index)
      heap_down(left_child_index)
    else
      puts "***** here ****"
      swap(right_child_index, parent_index)
      heap_down(right_child_index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end

  # These helper methods find the index of the
  # current item's parent node, and the indices
  # of its left and right children
  def find_parent_index(node_index)
    return ((node_index-1)/2).floor
  end

  def find_left_child_index(node_index)
    return node_index * 2 + 1
  end

  def find_right_child_index(node_index)
    return node_index * 2 + 2
  end
end