require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Search < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Security, [:securities, :security])
        end

      end
    end
  end
end
