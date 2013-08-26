require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class GainlossCollection < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::GainlossCollection, @attrs[:accounts][:account])
        end

      end
    end
  end
end
