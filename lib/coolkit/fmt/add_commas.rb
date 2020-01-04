module Coolkit

  # Convert an integer to a string and add commas.
  # Source: [Adding commas to numbers in Ruby (Stack Overflow)](https://stackoverflow.com/a/23169586/7687024)
  #
  # @example
  #   Coolkit.add_commas(1234567) #=> "1,234,567"
  #
  # @param number [Integer]
  # @return [String]
  def self.add_commas(number)
    number.to_s.reverse.scan(/\d{3}|.+/).join(",").reverse
  end

end
