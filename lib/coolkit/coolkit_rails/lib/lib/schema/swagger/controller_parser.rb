module Lib
  module Schema
    module Swagger
      class ControllerParser

        # @return [TopLevelParser]
        attr_accessor(:top_level_parser)

        # @return [YARD::CodeObjects::Base]
        attr_accessor(:code_object)

        # @return [String]
        attr_accessor(:swagger_tag_name)

        # @return [Array<YARD::CodeObjects::Base>]
        attr_accessor(:actions)

        # @return [void]
        def initialize(top_level_parser, code_object)
          self.top_level_parser = top_level_parser
          self.code_object = code_object
          self.actions = []
          self.set_swagger_tag_name()
        end

        # @return [void]
        def parse_1()
          self.code_object.meths.each do |method|
            method.tags.each do |tag|
              if tag.tag_name == "route"
                self.top_level_parser.paths[tag.text.downcase] = {}
                self.actions << method
              end
            end
          end
        end

        # @return [void]
        def parse_2()
          self.actions.each do |action|
            route       = action.tags.select{ |x| x.tag_name == "route"  }&.first&.text
            http_method = action.tags.select{ |x| x.tag_name == "action" }&.first&.text
            action_parser = ActionParser.new(action, self.swagger_tag_name, route)
            action_parser.parse()
            top_level_parser.paths[route.downcase][http_method.downcase] = action_parser.to_h()
          end
        end

        # @return [void]
        def set_swagger_tag_name()
          self.swagger_tag_name = self.code_object.tags.select{ |x| x.tag_name == "resource" }&.first&.text
          self.top_level_parser.swagger_tags << self.swagger_tag_name
        end

      end
    end
  end
end
