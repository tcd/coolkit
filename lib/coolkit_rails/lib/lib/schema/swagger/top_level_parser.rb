module Lib
  module Schema
    module Swagger
      class TopLevelParser

        # @return [YARD::Registry]
        attr_accessor(:registry)

        # @return [Array<YARD::CodeObjects::Base>]
        attr_accessor(:controller_code_objects)

        # @return [Array<ControllerParser>]
        attr_accessor(:controller_parsers)

        # @return [String]
        attr_accessor(:api_version)

        # @return [Hash{String => Object}]
        attr_accessor(:paths)

        # @return [Array<String>]
        attr_accessor(:swagger_tags)

        # @return [void]
        def initialize()
          self.api_version = "2.0"
          self.paths = {}
          self.swagger_tags = []
          self.controller_parsers = []
          self.controller_code_objects = []
        end

        # @return [Hash]
        def to_h()
          data = {}
          data["openapi"] = "3.0.2"
          data["info"] = {
            title: "Combo Notebook Api",
            contact: {
              email: "dunstontc@gmail.com",
            },
            version: self.api_version,
          }
          unless self.swagger_tags.blank?
            data["tags"] = self.swagger_tags.sort.map do |t|
              { name: t }
            end
          end
          data["paths"] = self.paths.sort.to_h
          return data
        end

        # @return [void]
        def generate()
          Rails.application.eager_load!()
          yard_path = Rails.root.join(".yardoc").to_s
          self.registry = YARD::Registry.load(yard_path)
          Api::ApiController.descendants.map(&:to_s).each do |name|
            code_object = self.registry.at(name)
            is_valid_controller = code_object.tags.select{ |x| x.tag_name == "api_version" }&.first&.text == self.api_version
            if is_valid_controller
              self.controller_code_objects << code_object
              self.controller_parsers << ControllerParser.new(self, code_object)
            end
          end
          self.controller_parsers.each(&:parse_1)
          self.controller_parsers.each(&:parse_2)
          # ap(self.paths)
          puts("swagger file generated: " + Lib::Util.save_to_file(JSON.pretty_generate(self.to_h), "swagger/swagger.json"))
          return nil
        end

      end
    end
  end
end
