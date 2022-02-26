require "fileutils"
require "tmpdir"
require "pathname"

module MockFs

# Execute code in a given block with the following temporary folder structure provided:
#
#   test_fs/
#   └── file
#
# @yieldparam [Pathname] root_folder
# @return [void]
def with_test_file(&_block)
  root_dir = Pathname.new(Dir.mktmpdir("test_fs"))
  file = root_dir + "file"
  FileUtils.touch(file)
  yield(file) if block_given?
  FileUtils.rm_rf(root_dir)
end

  # Execute code in a given block with the following temporary folder structure provided:
  #
  #   test_fs
  #   ├── bad_link -> test_fs/doesnt_matter
  #   ├── dir_2
  #   │   ├── sub_dir_1
  #   │   │   └── deep_file
  #   │   └── sub_dir_2
  #   │       └── deep_file
  #   ├── file 3.rb
  #   ├── file-2.rb
  #   ├── file_1
  #   └── good_link -> test_fs/file_1
  #
  # @yieldparam [Pathname] root_folder
  # @return [void]
  def with_test_folder(&block)
    root_dir = Pathname.new(Dir.mktmpdir("test_fs"))

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

end
