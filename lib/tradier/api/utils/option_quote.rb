require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class OptionQuote < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::OptionQuote, @attrs[:options][:option])
        end

      end
    end
  end
end
