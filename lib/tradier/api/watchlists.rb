require 'tradier/api/utils'

module Tradier
  module API
    module Watchlists
      include Tradier::API::Utils

      def watchlists(options={})
        watchlist_objects_from_response(Tradier::Watchlist, :get, '/watchlists', options)
      end

      def watchlist(id, options={})
        watchlist_object_from_response(Tradier::Watchlist, :get, "/watchlists/#{id}", options)
      end

      def delete_watchlist(id, options={})
        send(:delete, "/watchlists/#{id}", options)[:status] == 200
      end

      def create_watchlist(id, options={})
        watchlist_object_from_response(Tradier::Watchlist, :post, '/watchlists', options)
      end

    end
  end
end
