require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class History < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:history][:day]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::History.from_response(element)
            end
          else
            [Tradier::History.from_response(response_body)]
          end
        end

      end
    end
  end
end
