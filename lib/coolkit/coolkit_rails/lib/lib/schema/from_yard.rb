module Lib
  module Schema
    # Pull data from YARD docs.
    module FromYard

      # @return [void]
      def self.generate()
        V3.generate()
      end

      # @return [void]
      def self.generate_json_models()
        V3.generate_json_models()
      end

    end
  end
end
