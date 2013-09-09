require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Event < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Event, [:history, :event])
        end

      end
    end
  end
end
