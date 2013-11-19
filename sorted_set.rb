class BasicArraySortedSet
  # Create your internal data structure here. It should be an empty array
  def initialize
    @my_array = []
  end

  def name
    "Basic Array"
  end

  # Use the array's native insert method
  def insert(element)
      if (@my_array.include? element) 
        false
      else
        @my_array << element;
        element
      end
  end

  # Use the array's native include method
  def include?(element)
    @my_array.include? element
  end

  # Use the array's native sort method
  def get_sorted_array
    @my_array.sort
  end
end

# Similar to above, use the hash's internal methods to implement
# the sorted set's methods
class HashSortedSet
  def initialize
    @my_hash = {}
  end

  def name
    "Basic Hash"
  end

  # Insert the key value pair (element, true)
  def insert(element)
    if include? element
      false
    else
      @my_hash[element] = true
      element
    end
  end

  def include?(element)
    @my_hash[element]
  end

  def get_sorted_array
    @my_hash.keys.sort
  end
end

# Internally use an array to represent the set
# Maintain alphabetical order within the array, so that you can return
# it when asking for sorted array
class ArraySortedSet
  def initialize
    @my_array =[]
  end

  def name
    "Sorted Array"
  end

  # Insert the element at the proper index to maintain the sort order
  def insert(element)
       if (@my_array.include? element) 
        false
      else
        if @my_array.length ==0
           @my_array << element
          return element
        end

        new_index = 0;
        while(new_index < @my_array.length) do
          val = @my_array[new_index] 
          if element < val
            break;
          end
          new_index+=1
        end
        
        @my_array.insert(new_index, element)
        element
      end
  end

  def include?(element)
    @my_array.include? element
  end

  # You should be able to simply return the original array
  def get_sorted_array
    @my_array
  end
end


class BinaryArraySortedSet
  def initialize
    @my_array=[]
  end

  def name
    "Bsearch Array"
  end

  # Insert the element and maintain sorted order
  def insert(element)
      if (@my_array.include? element) 
        false
      else
        @my_array << element;
        @my_array = @my_array.sort
        element
      end
  end

  # Search for the element using binary search
  def include?(element)
    if @my_array.length <=1 
      @my_array.include? element
    else
      mid = @my_array.length/2
      if @my_array[mid] >  element
        binary_search(0, mid-1, element)
      else
        binary_search(mid, @my_array.length-1, element)
      end
    end

  end

  # Return the original array (it should be sorted)
  def get_sorted_array
    @my_array
  end

  # A little helper method to help you implement binary search
  # This method should run as follows
  #   If the subset has 0 or 1 element, do a simple search
  #   If the subset has more than 1 element...
  #     Find the midpoint of the range
  #     Compare if the middle element is higher or lower than your element
  #       If the element is higher
  #         Do a binary_search on the lower half
  #       If the element is lower
  #         Do a binary search on the upper half
  def binary_search(from_index, to_index, element)
    # this is a list of index into my_array
    index_array = (from_index..to_index).to_a;

    #checkthelength of the inxex range
    if index_array.length <=1 
      @my_array[from_index..to_index].include? element
    else
      mid = index_array.length/2
      if @my_array[index_array[mid]] >  element
        binary_search(0, index_array[mid]-1, element)
      else
        binary_search(index_array[mid], to_index, element)
      end
    end
  end
end
