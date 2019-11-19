# Useful ruby code with no dependencies
module Coolkit
  VERSION = "0.2.2".freeze
end

Dir.glob(File.join(__dir__, "coolkit", "/**/*.rb")).sort.each { |file| require file }
