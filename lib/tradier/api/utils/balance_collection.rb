require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class BalanceCollection < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::BalanceCollection, @attrs[:accounts][:account])
        end

      end
    end
  end
end
