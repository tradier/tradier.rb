require 'tradier/api/utils'

module Tradier
  module API
    module Orders
      include Tradier::API::Utils

      # @see https://developer.tradier.com/documentation/trading/create-order
      # @rate_limited Yes
      # @authentication Requires user context
      # Place an order.
      # @param [Hash] options
      # @option options [String] :account The account number.
      # @return [Tradier::Order] An order.
      # @raise [Tradier::Error::BadRequest] Error raised when supplied order is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def create_order(options={})
        account = options.delete(:account)
        object_from_response(Tradier::Order, :post, "/accounts/#{account}/orders", options)
      end
      alias place_order create_order
      alias submit_order create_order

      # @see https://developer.tradier.com/documentation/trading/preview-order
      # @rate_limited Yes
      # @authentication Requires user context
      # Preview an order.
      # @return [Tradier::Order] An order.
      # @raise [Tradier::Error::BadRequest] Error raised when supplied order is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def preview_order(options={})
        create_order(options.merge(preview: true))
      end

      # @see https://developer.tradier.com/documentation/trading/cancel-order
      # @rate_limited Yes
      # @authentication Requires user context
      # Cancel an order.
      # @param [Hash] options
      # @option options [String] :account The account number.
      # @option options [String] :id The id of the order.
      # @return [Tradier::Order] An order.
      # @raise [Tradier::Error::BadRequest] Error raised when supplied order is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def cancel_order(options={})
        account = options.delete(:account)
        id      = options.delete(:id)
        object_from_response(Tradier::Order, :delete, "/accounts/#{account}/orders/#{id}", options)
      end

      # @see https://developer.tradier.com/documentation/accounts/get-account-order
      # @rate_limited Yes
      # @authentication Requires user context
      # Retrieve an order.
      # @param [Hash] options
      # @option options [String] :account The account number.
      # @option options [String] :id The id of the order.
      # @return [Tradier::Order] An order.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def order(options={})
        account = options.delete(:account)
        id      = options.delete(:id)
        object_from_response(Tradier::Order, :get, "/accounts/#{account}/orders/#{id}", options)
      end

      # @see https://developer.tradier.com/documentation/trading/change-order
      # @rate_limited Yes
      # @authentication Requires user context
      # Update an order.
      # @param [Hash] options
      # @option options [String] :account The account number.
      # @option options [String] :id The id of the order.
      # @return [Tradier::Order] An order.
      # @raise [Tradier::Error::BadRequest] Error raised when supplied order is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def update_order(options={})
        account = options.delete(:account)
        id      = options.delete(:id)
        object_from_response(Tradier::Order, :put, "/accounts/#{account}/orders/#{id}", options)
      end
      alias change_order update_order
    end
  end
end
