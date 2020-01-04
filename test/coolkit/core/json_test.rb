require "test_helper"
require "coolkit/core/parse_json_file"

module CoreTest
  class JSONTest < TestCase

    def test_read
      data = Coolkit.parse_json_file(file_fixture("simple.json"))
      assert_equal("value", data["key"])
    end

    def test_read_with_options
      data = Coolkit.parse_json_file(file_fixture("simple.json"), symbolize_names: true)
      assert_equal("value", data[:key])
    end

  end
end
