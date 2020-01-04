require "json"

module Coolkit
  # Parse JSON data from a file at the given path.
  #
  # TODO: Test this on [ruby 2.7](https://blog.saeloun.com/2019/10/07/ruby-2-7-keyword-arguments-redesign.html)
  #
  # @param path [String]
  # @param opts [Hash] Options to pass to [`JSON.parse`](https://ruby-doc.org/stdlib-2.6.3/libdoc/json/rdoc/JSON.html#method-i-parse).
  # @param (see #parse)
  # @return [Hash]
  def self.parse_json_file(path, opts = {})
    return JSON.parse(File.read(File.expand_path(path)), opts)
  end
end
