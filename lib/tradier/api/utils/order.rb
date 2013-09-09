require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Order < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Order, [:orders, :order])
        end

      end
    end
  end
end
