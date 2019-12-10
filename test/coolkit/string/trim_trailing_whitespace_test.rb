require "test_helper"

class TrimTrailingWhitespaceTest < TestCase

  def test_1
    want = "Hello\nWorld\n"
    have = "Hello  \nWorld\n".trim_trailing_whitespace
    assert_equal(want, have)
  end

  def test_2
    want = "Hello\n  World\n"
    have = "Hello  \n  World\n".trim_trailing_whitespace
    assert_equal(want, have)
  end

  def test_3
    want = "Hello\n\n  World\n"
    have = "Hello  \n\n  World\n  ".trim_trailing_whitespace
    assert_equal(want, have)
  end

  def test_4
    want = "Hello\n\n  World"
    have = "Hello  \n\n  World".trim_trailing_whitespace
    assert_equal(want, have)
  end

end
