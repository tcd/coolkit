class String
  # Removes slashes, dashes, underscores, periods, parens, and multiple spaces from a string.
  #
  # @return [String]
  def normalize!()
    self.gsub!(/\s*\(.*\)|[']/, "")
    self.gsub!(%r{[._,\-/]}, " ")
    self.squeeze!(" ")
    return self
  end
end
