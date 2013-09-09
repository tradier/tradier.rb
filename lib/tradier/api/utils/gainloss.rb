require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Gainloss < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Position, [:gainloss, :closed_position])
        end

      end
    end
  end
end
