module Coolkit

  # @param string [String]
  # @return [String]
  def self.trim_trailing_whitespace!(string)
    string.gsub!(/([[:blank:]]+)$/, "")
    return string
  end

  # @param string [String]
  # @return [String]
  def self.trim_trailing_whitespace(string)
    return string.dup.tap { |s| trim_trailing_whitespace!(s) }
  end

end
