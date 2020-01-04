require "test_helper"
require "coolkit/core/string/comment"

module CoreTest
  module StringTest
    class CommentTest < TestCase

      def test_comment_1
        want = <<~STRING
          # def some_method
          #   some_code
          # end
        STRING
        input = <<~STRING
          def some_method
            some_code
          end
        STRING
        assert_equal(want, Coolkit.comment(input))
      end

      def test_comment_2
        assert_equal("# foo", Coolkit.comment("foo"))
        assert_equal("#   foo", Coolkit.comment("  foo"))
        assert_equal("# foo\n# \t\tbar", Coolkit.comment("foo\n\t\tbar"))
      end

      def test_comment_3
        assert_equal("# foo\n# \n# bar", Coolkit.comment("foo\n\nbar"))
        assert_equal("# foo\n\n# bar", Coolkit.comment("foo\n\nbar", indent_empty_lines: false))
      end

    end
  end
end
