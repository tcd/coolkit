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

  # # Append data to the end of a file.
  # # The file is created if it doesn"t exist.
  # #
  # # @param file [String] Path to the file.
  # # @param data [String,#to_s] Data to write to the file.
  # # @return [void]
  # def self.write_to_file_with_backup(file, data)
  #   FileUtils.mkdir_p(File.dirname(file))
  #   File.open(file, "a") { |f| f.write(data) }
  #   return nil
  # end

  # @return [String]
  def self.backup_file(file)
    path = Pathname.new(file)
    raise Coolkit::Errors::Error, "file '#{file}' not found" unless File.file?(file)
    backup_name = File.join(path.dirname, "#{path.basename}.bak")
    if File.file?(backup_name)
      i = 1
      loop do
        backup_name = File.join(path.dirname, "#{path.basename}.#{i}.bak")
        break unless File.file?(backup_name)
        i += 1
      end
    end
    FileUtils.cp(path, backup_name)
    return backup_name
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
end
