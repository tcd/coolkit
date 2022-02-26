require "test_helper"
require "fileutils"
require "time"

require "tmpdir"
require "pathname"

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

module FilesystemTest
  class MainTest < TestCase

    def test_write_to_file
      test_file = File.join(Coolkit.tmp_dir(), Time.now().nsec().to_s())
      Coolkit.write_to_file(test_file, "")
      assert(File.file?(test_file))
      FileUtils.rm_f(test_file)
    end

    def test_backup_file
      with_test_file do |file|
        # Make sure the original file exists
        assert(File.file?(file))
        # Make backups
        bak = Coolkit.backup_file(file)
        bak2 = Coolkit.backup_file(file)
        # Check their names
        assert_equal("file.bak", File.basename(bak))
        assert_equal("file.1.bak", File.basename(bak2))
        # Check that they exist
        assert(File.file?(bak))
        assert(File.file?(bak2))
        # Make sure the original file still
        assert(File.file?(file))
      end
    end

  end
end
