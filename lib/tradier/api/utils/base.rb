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

      end
    end
  end
end
