require "test_helper"
require "coolkit/core/string/indent"

module CoreTest
  module StringTest
    class IndentTest < TestCase

      def test_indent_1
        want = <<-STRING
  def some_method
    some_code
  end
        STRING
        input = <<~STRING
          def some_method
            some_code
          end
        STRING
        assert_equal(want, Coolkit.indent(input, 2))
      end

      def test_indent_2
        assert_equal("    foo", Coolkit.indent("  foo", 2))
        assert_equal("\t\tfoo\n\t\t\t\tbar", Coolkit.indent("foo\n\t\tbar", 2))
        assert_equal("\t\tfoo", Coolkit.indent("foo", 2, indent_string: "\t"))
      end

      def test_indent_3
        assert_equal("  foo\n\n  bar", Coolkit.indent("foo\n\nbar", 2))
        assert_equal("  foo\n  \n  bar", Coolkit.indent("foo\n\nbar", 2, indent_string: nil, indent_empty_lines: true))
      end

    end
  end
end
