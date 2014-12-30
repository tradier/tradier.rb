require 'tradier/base'

module Tradier
  class WatchlistItem < Tradier::Base
    attr_reader :id, :symbol, :shares, :purchase_price

    def self.from_response(body={})
      new(body[:item])
    end

    def purchase_date
      return unless @purchase_date || @attrs[:purchase_date]

      @purchase_date ||= Date.parse(@attrs[:purchase_date])
    end
  end
end
