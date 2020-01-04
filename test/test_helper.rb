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
  add_filter "/lib/coolkit/wip"

  add_group "Core Extensions", "lib/coolkit/core_ext"
  add_group "Core", "lib/coolkit/core"
  add_group "fmt", "lib/coolkit/fmt"

  # track_files "lib/**/*.rb"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "coolkit"
require "pry"

require "minitest/autorun"
require "minitest/focus"
require "minitest/reporters"
Minitest::Reporters.use!([
  # Minitest::Reporters::DefaultReporter.new(color: true),
  Minitest::Reporters::SpecReporter.new,
])

# puts "================================================================================"
# puts " Before Suite"
# puts "================================================================================"
#
# Minitest.after_run do
#   puts "================================================================================"
#   puts " After Suite"
#   puts "================================================================================"
# end

module MiniTest::Assertions
  # `assert_equal` with a default message.
  # @raise [ArgumentError] unless both arguments are strings
  # @param want [String] Expected
  # @param have [String] Actual
  def assert_equal_and_print(want, have)
    raise ArgumentError unless want.is_a?(String) && have.is_a?(String)

    clear = "\e[0m"
    _bold = "\e[1m"
    red = "\e[31m"
    green = "\e[32m"

    msg = <<~END
      #{'=' * 80}
      expected:
      #{green + want + clear}
      actual:
      #{red + have + clear}
      #{'=' * 80}
    END

    # assert_equal(want, have, "#{clear}\n#{'=' * 80}\nEXPECTED:\n\n#{want}\nACTUAL:\n\n#{have}\n#{'=' * 80}\n#{red}")
    assert_equal(want, have, ("\n" + clear + msg + red))
  end
end

class TestCase < Minitest::Test
  # Return path for a file used in tests.
  #
  # @param path [String]
  def file_fixture(path)
    return File.expand_path(File.join(File.dirname(__dir__), "test", "fixtures", "files", path))
  end

  unless defined?(Spec)
    # Helper to define a test method using a String.
    # Under the hood, it replaces spaces with underscores and defines the test method.
    # [Courtesy of ActiveSupport](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/testing/declarative.rb).
    #
    # @example
    #   test "verify something" do
    #     ...
    #   end
    #
    # @param name [String]
    # @return [void]
    def self.test(name, &block)
      test_name = "test_#{name.gsub(/\s+/, '_')}".to_sym
      defined = method_defined?(test_name)
      raise "#{test_name} is already defined in #{self}" if defined
      if block_given?
        define_method(test_name, &block)
      else
        define_method(test_name) do
          flunk "No implementation provided for #{name}"
        end
      end
    end
  end

end
