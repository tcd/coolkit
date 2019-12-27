require "json"
require "yaml"

module Coolkit
  # Convert a YAML file to JSON and write it out to a new file.
  #
  #
  # @param path [String]
  # @return [String]
  def self.yaml2json(path, pretty: true)
    path = File.expand_path(path)
    ext = case File.extname(path).downcase
          when ".yml"  then ".yml"
          when ".yaml" then ".yaml"
          else ""
          end
    base_name = File.basename(path, ext)
    dir = File.dirname(path)
    out_file = File.join(dir, "#{base_name}.json")
    input = YAML.load_file(path)
    output = pretty ? JSON.pretty_generate(input) : input.to_json
    File.open(out_file, "a") { |f| f.write(output) }
    return out_file
  end
end
