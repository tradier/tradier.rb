require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Timesales < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Timesales, @attrs[:series][:data])
        end

      end
    end
  end
end
