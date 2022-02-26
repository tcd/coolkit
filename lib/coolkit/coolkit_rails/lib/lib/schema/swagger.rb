module Lib
  module Schema
    # Generate Swagger doc
    module Swagger
      # @return [void]
      def self.generate()
        TopLevelParser.new().generate()
        return nil
      end
    end
  end
end
