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

      def cancel_order(options={})
        account = options.delete(:account)
        id      = options.delete(:id)
        object_from_response(Tradier::Order, :delete, "/accounts/#{account}/orders/#{id}", options)
      end

      def order(options={})
        account = options.delete(:account)
        id      = options.delete(:id)
        object_from_response(Tradier::Order, :get, "/accounts/#{account}/orders/#{id}", options)
      end

      def update_order(options={})
        account = options.delete(:account)
        id      = options.delete(:id)
        object_from_response(Tradier::Order, :put, "/accounts/#{account}/orders/#{id}", options)
      end
    end
  end
end
