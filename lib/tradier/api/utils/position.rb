require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Position < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Position, @attrs[:positions][:position])
        end

      end
    end
  end
end
