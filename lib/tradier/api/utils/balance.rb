require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Balance < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Balance, @attrs[:accounts][:account])
        end

      end
    end
  end
end
