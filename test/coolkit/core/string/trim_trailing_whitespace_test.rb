require "test_helper"
require "coolkit/core/string/trim_trailing_whitespace"

module CoreTest
  module StringTest
    class TrimTrailingWhitespaceTest < TestCase

      def test_1
        want = "Hello\nWorld\n"
        have = Coolkit.trim_trailing_whitespace("Hello  \nWorld\n")
        assert_equal(want, have)
      end

      def test_2
        want = "Hello\n  World\n"
        have = Coolkit.trim_trailing_whitespace("Hello  \n  World\n")
        assert_equal(want, have)
      end

      def test_3
        want = "Hello\n\n  World\n"
        have = Coolkit.trim_trailing_whitespace("Hello  \n\n  World\n  ")
        assert_equal(want, have)
      end

      def test_4
        want = "Hello\n\n  World"
        have = Coolkit.trim_trailing_whitespace("Hello  \n\n  World")
        assert_equal(want, have)
      end

    end
  end
end
