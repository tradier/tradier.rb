require 'tradier/base'
require 'tradier/watchlist_item'

module Tradier
  class Watchlist < Tradier::Base
    attr_reader :id, :name

    def self.from_response(body={})
      new(body[:watchlist] || body)
    end

    def items
      @items ||= begin
        if @attrs[:items][:item].kind_of?(Array)
          @attrs[:items][:item].map { |i| Tradier::WatchlistItem.new(i) }
        elsif @attrs[:items][:item].kind_of?(Hash)
          [Tradier::WatchlistItem.new(@attrs[:items][:item])]
        else
          []
        end
      end
    end
  end
end
