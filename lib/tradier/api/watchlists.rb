require 'tradier/api/utils'

module Tradier
  module API
    module Watchlists
      include Tradier::API::Utils

      def watchlists(options={})
        response = object_from_response(Tradier::API::Utils::Watchlist, :get, '/watchlists', options).body
      end

      def watchlist(id, options={})
        object_from_response(Tradier::Watchlist, :get, "/watchlists/#{id}", options)
      end

      def delete_watchlist(id, options={})
        send(:delete, "/watchlists/#{id}", options)[:status] == 200
      end

      def create_watchlist(id, options={})
        object_from_response(Tradier::Watchlist, :post, '/watchlists', options)
      end

      def update_watchlist(id, options={})
        object_from_response(Tradier::Watchlist, :put, "/watchlists/#{id}", options)
      end

      def watchlist_item(id, symbol, options={})
        object_from_response(Tradier::WatchlistItem, :get, "/watchlists/#{id}/symbols/#{symbol}", options)
      end

      def add_watchlist_item(id, options={})
        object_from_response(Tradier::WatchlistItem, :post, "/watchlists/#{id}/symbols", options)
      end
      alias create_watchlist_item add_watchlist_item

      def remove_watchlist_item(id, symbol, options={})
        send(:delete, "/watchlists/#{id}/symbols/#{symbol}", options)[:status] == 200
      end
      alias delete_watchlist_item remove_watchlist_item

      def update_watchlist_item(id, symbol, options={})
        object_from_response(Tradier::WatchlistItem, :put, "/watchlists/#{id}/symbols/#{symbol}", options)
      end

    end
  end
end
