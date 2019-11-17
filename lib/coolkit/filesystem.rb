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
  end
end
