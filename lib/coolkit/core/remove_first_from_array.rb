module Coolkit

  # Remove the first instance of an item from an array.
  # **Note**: this will mutate the reciever.
  #
  # @param array [Array]
  # @param item [Object]
  # @return [self]
  def self.remove_first_from_array!(array, item)
    return array if array.length == 0
    index = array.index(item)
    array.delete_at(index) if index
    return array
  end

  # Return a copy of an array the first instance of a given item removed.
  #
  # @param array [Array]
  # @param item [Object]
  # @return [self]
  def self.remove_first_from_array(array, item)
    return array.dup.tap { |a| remove_first_from_array!(a, item) }
  end

end
