require "test_helper"

module FilesystemTest
  class ClearFolderTest < TestCase

    def test_that_only_top_level_files_are_deleted
      skip()
      with_test_folder do |root_dir|
        deleted_files = Coolkit.clean_folder(root_dir)
        assert_equal(5, deleted_files)
      end
    end

  end
end
