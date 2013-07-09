require 'tradier/api/utils'

module Tradier
  module API
    module Watchlists
      include Tradier::API::Utils

      def watchlists(options={})
        watchlist_objects_from_response(Tradier::Watchlist, :get, '/watchlists', options)
      end

    end
  end
end
