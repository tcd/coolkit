require "test_helper"
require "fileutils"
require "tmpdir"
require "pathname"

def with_test_folder(&_block)
  root_dir = Pathname.new(Dir.mktmpdir("minitestfs"))

  (root_dir + ".dir_1").mkdir
  (root_dir + "dir_2").mkdir
  (root_dir + "dir_2" + "sub_dir_1").mkdir
  (root_dir + "dir_2" + "sub_dir_2").mkdir

  FileUtils.touch(root_dir + "file_1")
  FileUtils.touch(root_dir + "file-2.rb")
  FileUtils.touch(root_dir + "file 3.rb")
  FileUtils.touch(root_dir + ".file_4")
  FileUtils.ln_s(root_dir + "file_1", root_dir + "good_link")
  FileUtils.ln_s(root_dir + "doesnt_matter", root_dir + "bad_link")
  FileUtils.touch(root_dir + "dir_2" + "sub_dir_1" + "deep_file")
  FileUtils.touch(root_dir + "dir_2" + "sub_dir_2" + "deep_file")
  FileUtils.touch(root_dir + ".dir_1" + "deep_file")

  yield(root_dir) if block_given?

  FileUtils.rm_rf(root_dir)
end

class LSTest < TestCase

  def test_list_files
    want = [
      "file_1",
      "file-2.rb",
      "file 3.rb",
      ".file_4",
      "good_link",
    ]
    with_test_folder do |root_dir|
      files = Coolkit.list_files(root_dir)
      assert_equal(want.sort, files.sort)
    end
  end

  def test_list_files_recursively
    want = [
      "deep_file",
      "deep_file",
      "deep_file",
      "file_1",
      "file-2.rb",
      "file 3.rb",
      ".file_4",
      "good_link",
    ]
    with_test_folder do |root_dir|
      files = Coolkit.list_files_recursive(root_dir)
      assert_equal(want.sort, files.sort)
    end
  end

  def test_list_files_without_links
    skip("We don't have code that will pass this yet.")
    # want = ["file_1", "file-2.rb", "file 3.rb", ".file_4", "not_a_dir", "not_a_link"]
    # with_test_folder do |root_dir|
    # #   files = Coolkit.list_files(root_dir)
    #   assert_equal(want.sort, files.sort)
    # end
  end

  def test_list_files_recursively_without_links
    skip("We don't have code that will pass this yet.")
    # want = ["deep_file", "deep_file", "file_1", "file-2.rb", "file 3.rb", ".file_4"]
    # with_test_folder do |root_dir|
    # #   files = Coolkit.list_files_recursive(root_dir)
    #   assert_equal(want.sort, files.sort)
    # end
  end

end
