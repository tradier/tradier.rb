require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Quote < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Quote, [:quotes, :quote])
        end

      end
    end
  end
end
