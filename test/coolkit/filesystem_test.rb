require "test_helper"
require "fileutils"
require "time"

class FilesystemTest < TestCase

  def test_write_to_file
    test_file = File.join(Coolkit.tmp_dir(), Time.now().nsec().to_s())
    Coolkit.write_to_file(test_file, "")
    assert(File.file?(test_file))
    FileUtils.rm_f(test_file)
  end

  def test_list_files
    skip()
  end

  def test_clear_folder
    skip()
  end

end
