require "test_helper"
require "coolkit/core_ext/json/parse_file"

module CoreExtTest
  class JSONTest < TestCase

    def test_read
      data = JSON.parse_file(file_fixture("simple.json"))
      assert_equal("value", data["key"])
    end

    def test_read_with_options
      data = JSON.parse_file(file_fixture("simple.json"), symbolize_names: true)
      assert_equal("value", data[:key])
    end

  end
end
