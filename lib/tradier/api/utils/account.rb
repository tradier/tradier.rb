require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Account < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Account, @attrs[:accounts][:account])
        end

      end
    end
  end
end
