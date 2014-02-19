require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Expiration < Tradier::API::Utils::Base

        def body
          return [] unless @attrs[:expirations].kind_of?(Hash)

          if @attrs[:expirations].has_key?(:expiration)
            @attrs[:expirations].fetch(:expiration, []).map do |element|
              Tradier::Expiration.from_response(element)
            end
          else
            @attrs[:expirations].fetch(:date, []).map do |element|
              Date.parse(element)
            end
          end
        end

      end
    end
  end
end
