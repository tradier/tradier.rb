require 'tradier/api/utils'

module Tradier
  module API
    module Watchlists
      include Tradier::API::Utils

      # @see https://developer.tradier.com/documentation/watchlists/get-watchlists
      # @rate_limited Yes
      # @authentication Requires user context
      # Get all watchlists.
      # @return [Array<Tradier::Watchlist>] An array of watchlists.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def watchlists(options={})
        response = object_from_response(Tradier::API::Utils::Watchlist, :get, '/watchlists', options).body
      end

      # @see https://developer.tradier.com/documentation/watchlists/get-specific-watchlist
      # @rate_limited Yes
      # @authentication Requires user context
      # Get a watchlist.
      # @param [String] id The watchlist id.
      # @return [Tradier::Watchlist] A watchlist.
      # @raise [Tradier::Error::NotFound] Error raised when watchlist is not found.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def watchlist(id, options={})
        object_from_response(Tradier::Watchlist, :get, "/watchlists/#{id}", options)
      end

      # @see https://developer.tradier.com/documentation/watchlists/delete-watchlist
      # @rate_limited Yes
      # @authentication Requires user context
      # Delete a watchlist.
      # @param [String] id The watchlist id.
      # @return [Boolean] Result of watchlist removal.
      # @raise [Tradier::Error::NotFound] Error raised when watchlist is not found.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def delete_watchlist(id, options={})
        send(:delete, "/watchlists/#{id}", options)[:status] == 200
      end

      # @see https://developer.tradier.com/documentation/watchlists/create-watchlist
      # @rate_limited Yes
      # @authentication Requires user context
      # Create a new watchlist.
      # @param [Hash] options
      # @option options [String] :name The watchlist name.
      # @return [Tradier::Watchlist] A watchlist.
      # @raise [Tradier::Error::BadRequest] Error raised when request is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def create_watchlist(options={})
        object_from_response(Tradier::Watchlist, :post, '/watchlists', options)
      end

      # @see https://developer.tradier.com/documentation/watchlists/update-watchlist
      # @rate_limited Yes
      # @authentication Requires user context
      # Update a watchlist.
      # @param [String] id The watchlist id.
      # @param [Hash] options
      # @option options [String] :name The watchlist name.
      # @return [Tradier::Watchlist] A watchlist.
      # @raise [Tradier::Error::BadRequest] Error raised when request is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def update_watchlist(id, options={})
        object_from_response(Tradier::Watchlist, :put, "/watchlists/#{id}", options)
      end

      # @see https://developer.tradier.com/documentation/watchlists/update-watchlist
      # @rate_limited Yes
      # @authentication Requires user context
      # Retrieve a watchlist symbol.
      # @param [String] id The watchlist id.
      # @param [String] symbol The watchlist symbol.
      # @return [Tradier::WatchlistItem] A watchlist item.
      # @raise [Tradier::Error::NotFound] Error raised when watchlist or watchlist item is not found.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def watchlist_item(id, symbol, options={})
        object_from_response(Tradier::WatchlistItem, :get, "/watchlists/#{id}/symbols/#{symbol}", options)
      end
      alias watchlist_symbol watchlist_item

      # @see https://developer.tradier.com/documentation/watchlists/add-watchlist-symbol
      # @rate_limited Yes
      # @authentication Requires user context
      # Update a watchlist symbol.
      # @param [String] id The watchlist id.
      # @param [Hash] options
      # @option options [String] :symbols A comma delimited list of symbols.
      # @return [Tradier::Watchlist] A watchlist.
      # @raise [Tradier::Error::BadRequest] Error raised when request is not valid.
      # @raise [Tradier::Error::NotFound] Error raised when watchlist is not found.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def add_watchlist_item(id, options={})
        object_from_response(Tradier::WatchlistItem, :post, "/watchlists/#{id}/symbols", options)
      end
      alias create_watchlist_item add_watchlist_item
      alias create_watchlist_symbol add_watchlist_item
      alias add_watchlist_symbol add_watchlist_item

      # @see https://developer.tradier.com/documentation/watchlists/remove-watchlist-symbol
      # @rate_limited Yes
      # @authentication Requires user context
      # Remove a watchlist symbol.
      # @param [String] id The watchlist id.
      # @param [String] symbol The watchlist symbol.
      # @return [Tradier::Watchlist] A watchlist.
      # @raise [Tradier::Error::NotFound] Error raised when watchlist or watchlist item is not found.
      # @raise [Tradier::Error::BadRequest] Error raised when request is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def remove_watchlist_item(id, symbol, options={})
        send(:delete, "/watchlists/#{id}/symbols/#{symbol}", options)[:status] == 200
      end
      alias delete_watchlist_item remove_watchlist_item
      alias remove_watchlist_symbol remove_watchlist_item
      alias delete_watchlist_symbol remove_watchlist_item

      # @see https://developer.tradier.com/documentation/watchlists/update-watchlist-symbol
      # @rate_limited Yes
      # @authentication Requires user context
      # Update a watchlist symbol.
      # @param [String] id The watchlist id.
      # @param [String] symbol The watchlist symbol.
      # @param [Hash] options
      # @option options [String] :shares The number of shares.
      # @option options [String] :purchase_date The purchase date.
      # @option options [String] :purchase_price The purchase price.
      # @return [Tradier::WatchlistItem] A watchlist item.
      # @raise [Tradier::Error::NotFound] Error raised when watchlist or watchlist item is not found.
      # @raise [Tradier::Error::BadRequest] Error raised when request is not valid.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def update_watchlist_item(id, symbol, options={})
        object_from_response(Tradier::WatchlistItem, :put, "/watchlists/#{id}/symbols/#{symbol}", options)
      end
      alias update_watchlist_symbol update_watchlist_item

    end
  end
end
