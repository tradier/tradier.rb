require 'tradier/api/utils'

module Tradier
  module API
    module Orders
      include Tradier::API::Utils

      def create_order(options={})
        account = options.delete(:account)
        object_from_response(Tradier::Order, :post, "/accounts/#{account}/orders", options)
      end
      alias place_order create_order

    end
  end
end
