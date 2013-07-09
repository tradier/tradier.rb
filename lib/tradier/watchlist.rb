require 'tradier/base'
require 'tradier/watchlist_item'

module Tradier
  class Watchlist < Tradier::Base
    attr_reader :id, :name

    def items
      @items ||= @attrs[:items][:item].map { |i| Tradier::WatchlistItem.new(i) }
    end
  end
end
