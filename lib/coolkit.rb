# Useful ruby code with no dependencies
module Coolkit
  VERSION = "0.5.0".freeze
end

Dir.glob(File.join(__dir__, "coolkit", "*.rb")).sort.each { |file| require file }
Dir.glob(File.join(__dir__, "coolkit", "fs", "*.rb")).sort.each { |file| require file }
