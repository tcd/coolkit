module Lib
  # Functions for determining the type of an object.
  # NOTE: [TCD] (2022-02-26) I have no idea what this was used for
  module WeakTypes

    DECIMAL_PATTERN = /^-?\d+\.\d+$/.freeze()
    INTEGER_PATTERN = /^-?\d+(?:\.0+)?$/.freeze()

    # Checks to see if a string should be parsed as an integer value.
    #
    # @param string [String]
    #
    # @return [Boolean]
    def self.is_string_int?(string)
      return false if string.nil?()
      return true  if string.is_a?(Integer)
      return false unless string.is_a?(String)
      return INTEGER_PATTERN.match(string) != nil
    end

    # Checks to see if a string should be parsed as a decimal value.
    # Will return `false` if the string could be parsed as an integer.
    #
    # @param string [String]
    #
    # @return [Boolean]
    def self.is_string_decimal?(string)
      return false if string.nil?()
      return false if self.is_string_int?(string)
      return false unless string.is_a?(String)
      return DECIMAL_PATTERN.match(string) != nil
    end

    # Returns a Hash with a symbol value (`:type`) describing the type of the second value (`:value`).
    #
    # `result[:type]` will be one of the following symbols:
    #
    # - `:int`
    # - `:decimal`
    # - `:string`
    # - `:none`
    #
    # @param obj [Object]
    #
    # @return [Hash]
    def self.what_is?(obj)
      if obj.is_a?(Integer)
        return { type: :int, value: obj }
      end
      if obj.is_a?(String)
        if self.is_string_int?(obj)
          return { type: :int, value: obj.to_i() }
        end
        if self.is_string_decimal?(obj)
          return { type: :decimal, value: obj.to_f() }
        end
        return { type: :string, value: obj }
      end
      return { type: :none, value: nil }
    end

    # @param obj [Object]
    #
    # @return [WeakTypesData]
    def self.what_is_2?(obj)
      response = WeakTypesData.new()

      if obj.is_a?(Integer)
        response.set_values(:int, obj)
        return response
      end

      if obj.is_a?(String)
        if self.is_string_int?(obj)
          response.set_values(:int, obj.to_i())
          return response
        end
        if self.is_string_decimal?(obj)
          response.set_values(:decimal, obj.to_f())
          return response
        end
        response.set_values(:string, obj)
        return response
      end

      response.set_values(:none, nil)

      return response
    end

    # Type Data
    class WeakTypesData

      # @return [Array<Symbol>]
      GOOD_TYPES = [
        :int,
        :decimal,
        :string,
      ].freeze()

      # @!attribute original_value
      #   @return [Object]
      attr_accessor :original_value

      # @!attribute type_value
      #   One of the following symbols:
      #
      #   - `:int`
      #   - `:decimal`
      #   - `:string`
      #   - `:none`
      #   @return [Symbol<:int, :decimal, :string, :none>]
      attr_accessor :type_value

      # @!attribute value_value
      #   @return [Integer, Numeric, String, nil]
      attr_accessor :value_value

      # @param original_value [Object]
      #
      # @return [void]
      def initialize(original_value = nil)
        self.original_value = original_value
        self.type_value     = nil
        self.value_value    = nil
      end

      # @param type_value [Symbol<:int, :decimal, :string, :none>]
      # @param value_value [Integer, Float, String]
      #
      # @return [void]
      def set_values(type_value, value_value = nil)
        self.type_value  = type_value
        self.value_value = value_value
      end

      # @return [Boolean]
      def good_type?()
        return GOOD_TYPES.include?(self.type_value)
      end
    end

  end
end
