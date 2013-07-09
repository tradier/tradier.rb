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

    end
  end
end
