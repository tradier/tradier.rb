require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Quote < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:quotes][:quote]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::Quote.from_response(element)
            end
          else
            [Tradier::Quote.from_response(response_body)]
          end
        end

      end
    end
  end
end
