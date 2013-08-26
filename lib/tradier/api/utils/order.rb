require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Order < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:orders][:order]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::Order.from_response(element)
            end
          else
            [Tradier::Order.from_response(response_body)]
          end
        end

      end
    end
  end
end
