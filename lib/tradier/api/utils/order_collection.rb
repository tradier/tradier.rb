require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class OrderCollection < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::OrderCollection, @attrs[:accounts][:account])
        end

      end
    end
  end
end
