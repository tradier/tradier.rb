require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Expiration < Tradier::API::Utils::Base

        def body
          @attrs[:expirations][:date].map do |element|
            Date.parse(element)
          end
        end

      end
    end
  end
end