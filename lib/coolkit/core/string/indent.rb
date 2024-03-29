# Straight from [ActiveSupport][1]
#
# [1]:https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/string/indent.rb
module Coolkit

  # Same as {indent}, except it indents the receiver in-place.
  #
  # Returns the indented string, or `nil` if there was nothing to indent.
  #
  # @param string [String]
  # @param amount [Integer] The level of indentation to add.
  # @param indent_string [String] Defaults to tab if a tab is present in the string, and `" "` otherwise.
  # @param indent_empty_lines [Boolean] (false)
  #
  # @return [void]
  def self.indent!(string, amount, indent_string: nil, indent_empty_lines: false)
    indent_string = indent_string || string[/^[ \t]/] || " "
    re = indent_empty_lines ? /^/ : /^(?!$)/
    string.gsub!(re, indent_string * amount)
    return string
  end

  # Indents the lines in the receiver.
  #
  # The second argument, `indent_string`, specifies which indent string to use.
  # The default is `nil`, which tells the method to make a guess by peeking
  # at the first indented line, and fallback to a space if there is none.
  #
  # While `indent_string` is typically one space or tab, it may be any string.
  #
  # The third argument, `indent_empty_lines`, is a flag that says whether empty lines should be indented. Default is `false`.
  #
  # @param string [String]
  # @param amount [Integer] The level of indentation to add.
  # @param indent_string [String] Defaults to tab if a tab is present in the string, and `" "` otherwise.
  # @param indent_empty_lines [Boolean] (false)
  #
  # @return [String]
  def self.indent(string, amount, indent_string: nil, indent_empty_lines: false)
    return string.dup.tap { |s| indent!(s, amount, indent_string: indent_string, indent_empty_lines: indent_empty_lines) }
  end

end
