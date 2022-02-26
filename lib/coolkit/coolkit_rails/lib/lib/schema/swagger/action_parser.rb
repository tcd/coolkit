module Lib
  module Schema
    module Swagger
      class ActionParser

        PATH_PARAM_PATTERN = /\{(?<param_name>[a-zA-Z]+)\}/.freeze()

        # CodeObject for the action being parsed
        # @return [YARD::CodeObjects::MethodObject]
        attr_accessor(:code_object)

        # @return [ControllerParser]
        attr_accessor(:controller_parser)

        # @return [String]
        attr_accessor(:resource_name)

        # @return [Hash{String => Hash}]
        attr_accessor(:responses)

        # @return [String]
        attr_accessor(:operation_id)

        # @return [String]
        attr_accessor(:summary)

        # @return [String]
        attr_accessor(:description)

        # @return [String]
        attr_accessor(:path)

        # @return [Array<Hash>]
        attr_accessor(:parameters)

        # @return [void]
        def initialize(code_object, resource_name, request_path)
          self.code_object   = code_object
          self.resource_name = resource_name
          self.path          = request_path
          self.responses     = {}
          self.parameters    = []
          self.description   = self.code_object.docstring
        end

        # @return [Hash]
        def to_h()
          hash = {}

          hash["tags"] = [self.resource_name]

          unless self.description.blank?
            hash["summary"]     = self.description
            hash["description"] = self.description
          end

          unless self.responses.blank?
            hash["responses"] = self.responses
          end

          unless self.parameters.blank?
            hash["parameters"] = self.parameters
          end

          return hash
        end

        # @return [void]
        def parse()
          if (response_tags = self.code_object.tags.select { |x| x.tag_name == "response" })
            # @param response [YARD::Tags::Tag]
            response_tags.each do |response_tag|
              response = {}
              response["description"] = response_tag.text
              self.responses[response_tag.name] = response
            end
          end
          parse_path_params()
        end

        # @return [void]
        def parse_path_params()
          if (matches = self.path.scan(PATH_PARAM_PATTERN).flatten)
            matches.each do |match|
              self.parameters << {
                name: match,
                in: "path",
                # "description": "Id of resource to {action}",
                required: true,
                schema: {
                  type: "integer",
                  format: "int64",
                },
              }
            end
          end
        end

        # @return [Yard::Tags::Tag]
        def find_tag(tag_name)
          return Lib::Util.find_tag(self.code_object, tag_name)
        end

        # @return [Array<Yard::Tags::Tag>]
        def find_tags(tag_name)
          return Lib::Util.find_tags(self.code_object, tag_name)
        end

      end
    end
  end
end
