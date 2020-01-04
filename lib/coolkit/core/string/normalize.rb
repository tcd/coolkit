module Coolkit

  # Removes slashes, dashes, underscores, periods, parens, and multiple spaces from a string.
  #
  # @param string [String]
  # @return [String]
  def self.normalize!(string)
    string.gsub!(/\s*\(.*\)|[']/, "")
    string.gsub!(%r{[._,\-/]}, " ")
    string.squeeze!(" ")
    return string
  end

  # Removes slashes, dashes, underscores, periods, parens, and multiple spaces from a string.
  #
  # @param string [String]
  # @return [String]
  def self.normalize(string)
    return string.dup.tap { |s| normalize!(s) }
  end

end
