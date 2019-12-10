class String

  def trim_trailing_whitespace!
    gsub!(/([[:blank:]]+)$/, "")
  end

  def trim_trailing_whitespace
    return dup.tap(&:trim_trailing_whitespace!)
  end

end
