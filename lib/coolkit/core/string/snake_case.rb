module Coolkit

  # Returns a copy of a string converted to [*snake_case*](https://en.wikipedia.org/wiki/Snake_case)
  #
  # Removes slashes, dashes, underscores, spaces, periods, and parens.
  #
  # @param string [String]
  # @return [String]
  def self.snake_case(string)
    return string.gsub(/\s*\(.*\)|['.]/, "")
                 .gsub(%r{[,_\-/]}, " ")
                 .split(" ")
                 .map(&:downcase)
                 .join("_")
  end

end
