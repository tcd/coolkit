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

# - [How to make Ruby's Find.find follow symlinks? (Stack Overflow)](https://stackoverflow.com/questions/3974087/how-to-make-rubys-find-find-follow-symlinks)
# - [One-liner to recursively list directories in Ruby? (Stack Overflow)](https://stackoverflow.com/questions/2370702/one-liner-to-recursively-list-directories-in-ruby)
# - [Get names of all files from a folder with Ruby (Stack Overflow)](https://stackoverflow.com/a/45923193/7687024)
# - [find_follow.rb (gist)](https://gist.github.com/akostadinov/05c2a976dc16ffee9cac)
