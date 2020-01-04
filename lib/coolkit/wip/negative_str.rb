module Coolkit

  # Convert an integer to a string and replace a leading `-` with `_negative`.
  #
  # @example
  #   Coolkit.negative_str(-420) #=> "negative_420"
  #
  # @param number [Integer]
  # @param separator [String] ("_")
  # @return [String]
  def self.negative_str(number, separator: "_")
    return number.to_s.gsub(/^-/, "negative#{separator}")
  end

end
