require "test_helper"

class PathsTest < TestCase

  def test_root_dir
    assert_equal(Dir.pwd, Coolkit.root_dir())
  end

  def test_data_dir
    assert_equal(File.join(Dir.pwd, "data"), Coolkit.data_dir())
  end

  def test_tmp_dir
    assert_equal(File.join(Dir.pwd, "tmp"), Coolkit.tmp_dir())
  end

end
