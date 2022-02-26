require "test_helper"
require "coolkit/core/string/trim_trailing_whitespace"

module CoreTest
  module StringTest
    class TrimTrailingWhitespaceTest < TestCase

      def test_trailing_space_in_the_middle
        want  = "Hello\nWorld\n"
        input = "Hello  \nWorld\n"
        have  = Coolkit.trim_trailing_whitespace(input)
        assert_equal(want, have)
      end

      def test_trailing_whitespace_in_the_middle_and_at_the_end
        want  = "Hello\n  World\n"
        input = "Hello  \n  World\n"
        have  = Coolkit.trim_trailing_whitespace(input)
        assert_equal(want, have)
      end

      def test_trailing_whitespace_in_the_middle_and_at_the_end_with_an_empty_line
        want  = "Hello\n\n  World\n"
        input = "Hello  \n\n  World\n  "
        have  = Coolkit.trim_trailing_whitespace(input)
        assert_equal(want, have)
      end

      def test_that_empty_lines_are_unaffected
        want  = "Hello\n\n  World"
        input = "Hello  \n\n  World"
        have  = Coolkit.trim_trailing_whitespace(input)
        assert_equal(want, have)
      end

    end
  end
end
