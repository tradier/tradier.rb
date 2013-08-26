require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Strike < Tradier::API::Utils::Base

        def body
          @attrs[:strikes][:strike]
        end

      end
    end
  end
end
