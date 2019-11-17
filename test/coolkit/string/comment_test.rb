require "test_helper"

class CommentTest < TestCase

  def test_comment_1
    want = <<~STRING
      # def some_method
      #   some_code
      # end
    STRING
    have = <<~STRING.comment()
      def some_method
        some_code
      end
    STRING
    assert_equal(want, have)
  end

  def test_comment_2
    assert_equal("# foo", "foo".comment())
    assert_equal("#   foo", "  foo".comment())
    assert_equal("# foo\n# \t\tbar", "foo\n\t\tbar".comment())
  end

  def test_comment_3
    assert_equal("# foo\n# \n# bar", "foo\n\nbar".comment())
    assert_equal("# foo\n\n# bar", "foo\n\nbar".comment(false))
  end

end
