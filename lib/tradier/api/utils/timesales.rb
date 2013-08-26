require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Timesales < Tradier::API::Utils::Base

        def body
          response_body = @attrs[:series][:data]
          if response_body.is_a?(Array)
            response_body.map do |element|
              Tradier::Timesales.from_response(element)
            end
          else
            [Tradier::Timesales.from_response(response_body)]
          end
        end

      end
    end
  end
end
