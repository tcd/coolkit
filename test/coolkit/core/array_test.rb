require "test_helper"
require "coolkit/core/remove_first_from_array"

module CoreTest
  class ArrayTest < TestCase

    # @return [Array]
    def cases
      return [
        {
          description: "remove string",
          array:  ["one", "two", "three"],
          result: ["one", "three"],
          item: "two",
        },
        {
          description: "remove empty string",
          array:  ["one", "two", "", "three"],
          result: ["one", "two", "three"],
          item: "",
        },
        {
          description: "remove number",
          array:  [0, 1, 2, 4],
          result: [0, 1, 4],
          item: 2,
        },
        {
          description: "remove only the first occurrence of a number",
          array:  [0, 1, 2, 2, 4],
          result: [0, 1, 2, 4],
          item: 2,
        },
        {
          description: "remove symbol from mixed array",
          array:  [1, "two", :three, "three"],
          result: [1, "two", "three"],
          item: :three,
        },
        {
          description: "remove string from an empty array",
          array:  [],
          result: [],
          item: "value",
        },
        {
          description: "remove nil from an empty array",
          array:  [],
          result: [],
          item: nil,
        },
        {
          description: "remove item not present in array",
          array:  ["one", "two"],
          result: ["one", "two"],
          item: "three",
        },
      ]
    end

    def test_remove_first!
      cases = self.cases()
      cases.each do |c|
        assert_equal(c[:result], Coolkit.remove_first_from_array(c[:array], c[:item]))
      end
    end

  end
end
