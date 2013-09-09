require 'tradier/api/utils/base'

module Tradier
  module API
    module Utils
      class Watchlist < Tradier::API::Utils::Base

        def body
          nested_array(Tradier::Watchlist, [:watchlists, :watchlist])
        end

      end
    end
  end
end
