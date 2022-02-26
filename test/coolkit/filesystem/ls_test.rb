require "test_helper"

module FilesystemTest
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
end
