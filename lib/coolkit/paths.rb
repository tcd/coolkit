module Coolkit
  # Directory where the gem is located.
  # @return [String]
  def self.root_dir
    return File.expand_path("../../..", __FILE__)
  end

  # Directory for writing out files.
  # @return [String]
  def self.data_dir
    return File.join(self.root_dir, "data")
  end

  # Directory for writing out files.
  # @return [String]
  def self.tmp_dir
    return File.join(self.root_dir, "tmp")
  end
end
