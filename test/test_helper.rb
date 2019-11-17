require "simplecov"
formatters = []
formatters << SimpleCov::Formatter::HTMLFormatter
if ENV["CI"] == "true"
  require "coveralls"
  formatters << Coveralls::SimpleCov::Formatter
end
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)

SimpleCov.start do
  add_filter "/bin/"
  add_filter "/test/"

  track_files "lib/**/*.rb"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "coolkit"

require "minitest/autorun"
require "minitest/focus"
require "minitest/reporters"
Minitest::Reporters.use!([
  # Minitest::Reporters::DefaultReporter.new(color: true),
  Minitest::Reporters::SpecReporter.new,
])

class TestCase < Minitest::Test
  # Return path for a file used in tests.
  #
  # @param path [String]
  def file_fixture(path)
    return File.expand_path(File.join(File.dirname(__dir__), "test", "fixtures", "files", path))
  end
end

# puts "================================================================================"
# puts " Before Suite"
# puts "================================================================================"
#
# Minitest.after_run do
#   puts "================================================================================"
#   puts " After Suite"
#   puts "================================================================================"
# end
