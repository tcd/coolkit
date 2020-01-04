require "test_helper"

module FmtTest
  # [Using Ruby and Minitest, how do I run the same testcase with different data, controlled only by a list](https://stackoverflow.com/a/18771769/7687024)
  class AddCommasTests < Minitest::Test

    [
      { in: 0,         out: "0" },
      { in: 1_000,     out: "1,000" },
      { in: 1_234_567, out: "1,234,567" },
    ].each do |c|
      define_method("test_add_commas_to_integer_#{c[:in]}") do
        have = Coolkit.add_commas(c[:in])
        assert_equal(c[:out], have)
      end
    end

    [
      { in: 0,         out: "0" },
      { in: 1_000,     out: "1_000" },
      { in: 1_234_567, out: "1_234_567" },
    ].each do |c|
      define_method("test_add_underscore_to_integer_#{c[:in]}") do
        have = Coolkit.add_commas(c[:in], char: "_")
        assert_equal(c[:out], have)
      end
    end

    # [
    #   { in: 0.0,         out: "0.0" },
    #   { in: 1_000.0,     out: "1,000.0" },
    #   { in: 1_234_567.0, out: "1,234,567.0" },
    #   { in: 69.420,      out: "69.420" },
    # ].each do |c|
    #   define_method("test_add_commas_to_float_#{c[:in]}") do
    #     have = Coolkit.add_commas_to_float(c[:in])
    #     assert_equal(c[:out], have)
    #   end
    # end

  end
end
