require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class GainlossCollection < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:accounts][:account]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::GainlossCollection.from_response(element)
            end
          else
            [Tradier::GainlossCollection.from_response(response_body)]
          end
        end

      end
    end
  end
end
