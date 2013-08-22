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
      alias submit_order create_order

      def preview_order(options={})
        create_order(options.merge(preview: true))
      end
    end
  end
end
