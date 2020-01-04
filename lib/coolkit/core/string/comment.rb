module Coolkit

  # Adds a comment string (`"# "`) after every newline in a string.
  #
  # @param string [String]
  # @param indent_empty_lines [Boolean] (true)
  # @return [String]
  def self.comment!(string, indent_empty_lines: true)
    re = indent_empty_lines ? /^/ : /^(?!$)/
    string.gsub!(re, "# ")
    return string
  end

  # Returns a copy of a string with a comment (`"# "`) after every newline in a string.
  #
  # @param string [String]
  # @param indent_empty_lines [Boolean] (true)
  # @return [String]
  def self.comment(string, indent_empty_lines: true)
    return string.dup.tap { |s| comment!(s, indent_empty_lines: indent_empty_lines) }
  end

end
