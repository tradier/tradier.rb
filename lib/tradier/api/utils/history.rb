require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class History < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::History, [:history, :day])
        end

      end
    end
  end
end
