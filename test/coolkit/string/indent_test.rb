require "test_helper"

class IndentTest < TestCase

  def test_indent_1
    want = <<-STRING
  def some_method
    some_code
  end
    STRING
    have = <<~STRING.indent(2)
      def some_method
        some_code
      end
    STRING
    assert_equal(want, have)
  end

  def test_indent_2
    assert_equal("    foo", "  foo".indent(2))
    assert_equal("\t\tfoo\n\t\t\t\tbar", "foo\n\t\tbar".indent(2))
    assert_equal("\t\tfoo", "foo".indent(2, "\t"))
  end

  def test_indent_3
    assert_equal("  foo\n\n  bar", "foo\n\nbar".indent(2))
    assert_equal("  foo\n  \n  bar", "foo\n\nbar".indent(2, nil, true))
  end

end
