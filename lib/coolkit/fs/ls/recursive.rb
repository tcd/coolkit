require "fileutils"

module Coolkit
  # Recursively List all files (not folders) in a given directory.
  #
  # @see https://stackoverflow.com/questions/2370702/one-liner-to-recursively-list-directories-in-ruby
  # @see https://stackoverflow.com/a/45923193/7687024
  #
  # @param path [String] Path to the folder.
  # @return [Array<String>]
  def self.list_files_recursive(path)
    return Dir.glob(File.join(path, "**", "*"), File::FNM_DOTMATCH).select { |e| File.file?(e) }.map { |f| File.basename(f) }

    # dir = File.join(path, "**", "*")
    # files = Dir.glob(dir)
    # dir = File.expand_path(path)
    # return Dir.entries(dir).select { |f| File.file?(File.join(dir, f)) }
  end
end
