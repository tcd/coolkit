module Coolkit

  # Convert an integer to a string and add commas.
  # Source: [Adding commas to numbers in Ruby (Stack Overflow)](https://stackoverflow.com/a/23169586/7687024)
  #
  # @example
  #   Coolkit.add_commas(1234567) #=> "1,234,567"
  #
  # @example
  #   Coolkit.add_commas(1000, char: "_") #=> "1_000"
  #
  # @param number [Integer]
  # @param char [String] (",")
  # @return [String]
  def self.add_commas(number, char: ",")
    raise ArgumentError, "argument must be an Integer" unless number.is_a?(Integer)
    return number.to_s.reverse.scan(/\d{3}|.+/).join(char).reverse
  end

  # # Convert a float to a string and add commas.
  # #
  # # @example
  # #   Coolkit.add_commas(1234567.0) #=> "1,234,567.0"
  # #
  # # @param number [Integer, Float]
  # # @param char [String] (",") Character to use.
  # # @return [String]
  # def self.add_commas_to_float(number, char = ",")
  #   raise ArgumentError, "argument must be a Float" unless number.is_a?(Float)
  #   return number.to_s.reverse.scan(/\d{3}|.+/).join(char).reverse
  # end

end
