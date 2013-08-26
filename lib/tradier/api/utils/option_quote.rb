require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class OptionQuote < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:options][:option]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::OptionQuote.from_response(element)
            end
          else
            [Tradier::OptionQuote.from_response(response_body)]
          end
        end

      end
    end
  end
end
