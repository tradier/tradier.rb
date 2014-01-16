require 'tradier/base'
require 'tradier/watchlist_item'

module Tradier
  class Watchlist < Tradier::Base
    attr_reader :id, :name

    def self.from_response(body={})
      new(body[:watchlist] || body)
    end

    def items
      @items ||= @attrs[:items][:item].map { |i| Tradier::WatchlistItem.new(i) }
    end
  end
end
