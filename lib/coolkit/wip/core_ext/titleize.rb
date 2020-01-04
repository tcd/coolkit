module Coolkit

  # Returns a copy of a string with the first letter of each word capitalized.
  # @return [String]
  def titleize()
    return self.split(" ")
               .map(&:capitalize!)
               .join(" ")
  end

  # @return [String]
  def titleize2(string)
    words = self.split(" ")
    skips = ["and", "of", "the", "in", "to", "over", "an", "a"]
    words.each do |word|
      if word == words[0] || !skips.include?(word)
        element.capitalize!
      end
    end
    answer = array.join(" ")
    return answer
  end

end
