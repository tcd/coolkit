module Coolkit
  # Recursively convert keys in a Hash or Array to symbols.
  #
  # See:
  #
  # - [original code](https://avdi.codes/recursively-symbolize-keys/)
  # - [array support](https://gist.github.com/neektza/8585746)
  #
  # @example
  #
  #   hash = {"key" => [{"k" => :v}, {"k" => 5}]}
  #   Coolkit.symbolize_keys(hash) #=> {:key => [{:k => :v}, {:k => 5}]}
  #
  # @param arg [Hash,Array]
  # @return [Hash,Array]
  def self.symbolize_keys(arg)
    if arg.is_a?(Hash)
      arg.inject({}) do |result, (key, value)|
        new_key = case key
                  when String then key.to_sym()
                  else key
                  end
        new_value = case value
                    when Hash then symbolize_keys(value)
                    when Array then symbolize_keys(value)
                    else value
                    end
        result[new_key] = new_value
        result
      end
    elsif arg.is_a?(Array)
      arg.map { |e| symbolize_keys(e) }
    else
      arg
    end
  end
end
