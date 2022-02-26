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
  add_group "fs", "lib/coolkit/fs"

  # track_files "lib/**/*.rb"
end
