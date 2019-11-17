class Array
  # Remove the first instance of an item from an array.
  # **Note**: this will mutate the reciever.
  #
  # @param item [Object]
  # @return [self]
  def remove_first!(item)
    return self if self.length == 0
    index = self.index(item)
    self.delete_at(index) if index
    return self
  end

  # Return a copy of an array the first instance of a given item removed.
  #
  # @param item [Object]
  # @return [self]
  def remove_first(item)
    return self.dup.tap { |s| s.remove_first!(item) }
  end
end
