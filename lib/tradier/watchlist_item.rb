require 'tradier/base'

module Tradier
  class WatchlistItem < Tradier::Base
    attr_reader :symbol, :shares, :purchase_price

    def purchase_date
      return unless @purchase_date || @attrs[:purchase_date]

      @purchase_date ||= Date.parse(@attrs[:purchase_date])
    end
  end
end
