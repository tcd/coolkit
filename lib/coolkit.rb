# Useful ruby code with no dependencies
module Coolkit; end

Dir.glob(File.join(__dir__, "coolkit", "/**/*.rb")).sort.each { |file| require file }
