require "fileutils"

module Coolkit
  # Append data to the end of a file.
  # The file is created if it doesn"t exist.
  #
  # @param file [String] Path to the file.
  # @param data [String,#to_s] Data to write to the file.
  # @return [void]
  def self.write_to_file(file, data)
    FileUtils.mkdir_p(File.dirname(file))
    File.open(file, "a") { |f| f.write(data) }
    return nil
  end

  # Delete all files from a folder; returns number of deleted files.
  #
  # @param path [String] Path to the folder.
  # @return [Integer]
  def self.clean_folder(path)
    dir = File.expand_path(path)
    children = Dir.entries(dir).select { |f| File.file?(File.join(dir, f)) }
    deleted = File.unlink(*children)
    return deleted
  end

  # List all files (not folders) in a given folder.
  #
  # @see https://stackoverflow.com/a/45923193/7687024
  # @param path [String] Path to the folder.
  # @return [Array<String>]
  def self.list_files(path)
    dir = File.expand_path(path)
    return Dir.entries(dir).select { |f| File.file?(File.join(dir, f)) }
  end

  # # List all files (not folders) in a given folder.
  # #
  # # @see https://stackoverflow.com/questions/2370702/one-liner-to-recursively-list-directories-in-ruby
  # # @see https://stackoverflow.com/a/45923193/7687024
  # # @param path [String] Path to the folder.
  # # @return [Array<String>]
  # def self.list_files_recursive(path)
  #   dir = File.join(path, "**", "*")
  #   files = Dir.glob(dir)
  #   dir = File.expand_path(path)
  #   return Dir.entries(dir).select { |f| File.file?(File.join(dir, f)) }
  # end

end
