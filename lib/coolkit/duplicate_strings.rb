require "set"

module Coolkit

  # Return duplicate strings in an array.
  #
  # See:
  #
  # - [Ruby: How to find and return a duplicate value in array? - Stack Overflow](https://stackoverflow.com/questions/8921999/ruby-how-to-find-and-return-a-duplicate-value-in-array)
  # - [Benchmarks 1](https://gist.github.com/naveed-ahmad/8f0b926ffccf5fbd206a1cc58ce9743e)
  # - [Benchmarks 2](https://gist.github.com/equivalent/3c9a4c9d07fff79062a3)
  module Duplicates

    # [Source](https://stackoverflow.com/a/8922049/7687024)
    #
    # @param array [Array<String>]
    # @return [Array<String>]
    def self.v1(array)
      # return array.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
      return array.group_by(&:itself).select { |_, v| v.size > 1 }.map(&:first)
    end

    # [Source](https://stackoverflow.com/a/8922049/7687024)
    #
    # @param array [Array<String>]
    # @return [Array<String>]
    def self.v2(array)
      return array.sort.chunk { |e| e }.select { |e, chunk| chunk.size > 1 } .map(&:first)
    end

    # [Source](https://stackoverflow.com/a/41325530/7687024)
    #
    # @param array [Array<String>]
    # @return [Array<String>]
    def self.hash(array)
      h = Hash.new(0)
      return array.select { |each| (h[each] += 1) == 2 }
    end

    # [Source](https://stackoverflow.com/a/31354262/7687024)
    #
    # @param array [Array<String>]
    # @return [Array<String>]
    def self.set(array)
      s = Set.new
      return array.reject { |e| s.add?(e) }.uniq
    end

    # Will only work on Ruby 2.6+
    #
    # [Source](https://stackoverflow.com/a/31354262/7687024)
    #
    # @param array [Array<String>]
    # @return [Array<String>]
    def self.difference_between_unique(array)
      # class Array
      #   def difference(other)
      #     h = other.each_with_object(Hash.new(0)) { |e,h| h[e] += 1 }
      #     reject { |e| h[e] > 0 && h[e] -= 1 }
      #   end
      # end
      return array.difference(array.uniq)
    end

  end
end
