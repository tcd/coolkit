class String
  # Returns a copy of a string converted to [*PascalCase*](http://wiki.c2.com/?PascalCase), or *UpperCamelCase*.
  #
  # Removes slashes, dashes, underscores, spaces, periods, and parens.
  #
  # @param name [String]
  # @return [String]
  def pascal_case()
    return gsub(/\s*\(.*\)|[']/, "")
             .gsub(%r{[.,_\-/]}, " ")
             .split(" ")
             .map(&:capitalize)
             .join("")
  end

end
