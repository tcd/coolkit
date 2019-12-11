require "test_helper"
require "coolkit/core_ext/array/remove_first"

class ArrayTest < TestCase

  # @return [Array]
  def cases
    return [
      {
        description: "Remove string",
        array: ["one", "two", "three"],
        item: "two",
        result: ["one", "three"],
      },
      {
        description: "Remove empty string",
        array: ["one", "two", "", "three"],
        item: "",
        result: ["one", "two", "three"],
      },
      {
        description: "Remove number",
        array: [0, 1, 2, 4],
        item: 2,
        result: [0, 1, 4],
      },
      {
        description: "Remove only the first occurrence of a number",
        array: [0, 1, 2, 2, 4],
        item: 2,
        result: [0, 1, 2, 4],
      },
      {
        description: "Remove symbol from mixed array",
        array: [1, "two", :three, "three"],
        item: :three,
        result: [1, "two", "three"],
      },
      {
        description: "Remove string from an empty array",
        array: [],
        item: "value",
        result: [],
      },
      {
        description: "Remove nil from an empty array",
        array: [],
        item: nil,
        result: [],
      },
      {
        description: "Remove item not present in array",
        array: ["one", "two"],
        item: "three",
        result: ["one", "two"],
      },
      # {
      #   description: "",
      #   array: [],
      #   item: ,
      #   result: [],
      # },
    ]
  end

  def test_remove_first!
    cases = self.cases()
    cases.each do |c|
      c[:array].remove_first!(c[:item])
      assert_equal(c[:result], c[:array])
    end
  end

  def test_remove_first
    cases = self.cases()
    cases.each do |c|
      want = c[:result]
      original = c[:array]
      have = c[:array].remove_first(c[:item])
      # refute_equal(original, have)
      assert_equal(want, have)
    end
  end

end
