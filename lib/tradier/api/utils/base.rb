require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Base

        def self.from_response(body)
          self.new(body)
        end

        def initialize(attrs)
          @attrs = attrs
        end

        def nested_array(klass, response_body)
          if response_body.is_a?(Array)
            response_body.map do |element|
              klass.from_response(element)
            end
          else
            [klass.from_response(response_body)]
          end
        end

      end
    end
  end
end
