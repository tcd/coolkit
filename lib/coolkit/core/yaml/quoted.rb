require "psych"

module Coolkit

  # Converts the given object to yaml, but with quoted strings.
  #
  # See:
  #
  # - [How do I force double-quotes when dumping YAML? (Stack Overflow)](https://stackoverflow.com/questions/18316333/how-do-i-force-double-quotes-when-dumping-yaml)
  # - [psych - issue #322](https://github.com/ruby/psych/issues/322#issuecomment-328408276)
  #
  # @param object [Object]
  # @return [void]
  def self.to_yaml_quoted(object)
    ast = Psych.parse_stream(DATA.read)

    # First pass, quote everything
    ast.grep(Psych::Nodes::Scalar).each do |node|
      node.plain  = false
      node.quoted = true
      node.style  = Psych::Nodes::Scalar::DOUBLE_QUOTED
    end

    # Second pass, unquote keys
    ast.grep(Psych::Nodes::Mapping).each do |node|
      node.children.each_slice(2) do |k, _|
        k.plain  = true
        k.quoted = false
        k.style  = Psych::Nodes::Scalar::ANY
      end
    end
  end

end
