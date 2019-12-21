class String
  # Returns a copy of a string converted to [*snake_case*](https://en.wikipedia.org/wiki/Snake_case)
  #
  # Removes slashes, dashes, underscores, spaces, periods, and parens.
  #
  # @return [String]
  def snake_case()
    return gsub(/\s*\(.*\)|['.]/, "")
             .gsub(%r{[,_\-/]}, " ")
             .split(" ")
             .map(&:downcase)
             .join("_")
  end
end
