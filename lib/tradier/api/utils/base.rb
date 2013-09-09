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

        private

        def nested_array(klass, response_path)
          begin
            nested_attrs = nested_response_body(response_path)
            if nested_attrs.is_a?(Array)
              nested_attrs.map do |element|
                klass.from_response(element)
              end
            else
              [klass.from_response(nested_attrs)]
            end
          rescue TypeError => e
            []
          end
        end

        def nested_response_body(path)
          body = @attrs.dup

          path.each do |p|
            body = body[p]
          end

          body
        end

      end
    end
  end
end
