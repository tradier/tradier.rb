require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Gainloss < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:gainloss][:closed_position]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::Position.from_response(element)
            end
          else
            [Tradier::Position.from_response(response_body)]
          end
        end

      end
    end
  end
end
