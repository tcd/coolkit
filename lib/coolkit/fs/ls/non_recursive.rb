require "fileutils"

module Coolkit
  # List all files (not folders) in a given directory.
  # Symbolic links are included if they point to a valid file.
  #
  # @see https://stackoverflow.com/a/45923193/7687024
  #
  # @param path [String] Path to the folder.
  # @return [Array<String>
  def self.list_files(path)
    dir = File.expand_path(path)
    return Dir.entries(dir).select { |f| File.file?(File.join(dir, f)) }
  end
end
