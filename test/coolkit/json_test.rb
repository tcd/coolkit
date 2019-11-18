require "test_helper"
# require "json"

class JsonTest < TestCase

  def test_read
    data = JSON.read(file_fixture("simple.json"))
    assert_equal("value", data["key"])
  end

  focus
  def test_read_with_options
    data = JSON.read(file_fixture("simple.json"), symbolize_names: true)
    assert_equal("value", data[:key])
  end

end
