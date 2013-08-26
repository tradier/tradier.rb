require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class PositionCollection < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::PositionCollection, @attrs[:accounts][:account])
        end

      end
    end
  end
end
