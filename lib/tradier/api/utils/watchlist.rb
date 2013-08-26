require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Watchlist < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:watchlists][:watchlist]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::Watchlist.from_response(element)
            end
          else
            [Tradier::Watchlist.from_response(response_body)]
          end
        end

      end
    end
  end
end
