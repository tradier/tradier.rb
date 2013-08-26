require 'tradier/account'
require 'tradier/balance'
require 'tradier/balance_collection'
require 'tradier/calendar'
require 'tradier/clock'
require 'tradier/gainloss_collection'
require 'tradier/history'
require 'tradier/option_quote'
require 'tradier/order'
require 'tradier/position'
require 'tradier/position_collection'
require 'tradier/profile'
require 'tradier/quote'
require 'tradier/timesales'
require 'tradier/watchlist'

require 'tradier/api/utils/balance_collection'
require 'tradier/api/utils/expiration'
require 'tradier/api/utils/gainloss'
require 'tradier/api/utils/gainloss_collection'
require 'tradier/api/utils/history'
require 'tradier/api/utils/option_quote'
require 'tradier/api/utils/order'
require 'tradier/api/utils/order_collection'
require 'tradier/api/utils/position'
require 'tradier/api/utils/position_collection'
require 'tradier/api/utils/quote'
require 'tradier/api/utils/strike'
require 'tradier/api/utils/timesales'
require 'tradier/api/utils/watchlist'

module Tradier
  module API
    module Utils

      private


      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [klass instance]
      def object_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        klass.from_response(response_body)
      end

    end
  end
end
