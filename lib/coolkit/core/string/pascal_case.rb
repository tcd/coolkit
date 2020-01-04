module Coolkit

  # Returns a copy of a string converted to [*PascalCase*](http://wiki.c2.com/?PascalCase), or *UpperCamelCase*.
  #
  # Removes slashes, dashes, underscores, spaces, periods, and parens.
  #
  # @param string [String]
  # @return [String]
  def self.pascal_case(string)
    return string.gsub(/\s*\(.*\)|[']/, "")
                 .gsub(%r{[.,_\-/]}, " ")
                 .split(" ")
                 .map(&:capitalize)
                 .join("")
  end

end
