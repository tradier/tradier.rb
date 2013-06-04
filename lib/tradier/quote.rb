require 'tradier/base'

module Tradier
  class Quote < Tradier::Base

    def symbol
      @attrs[:VenSymbol]
    end

    def ==(quote)
      self.symbol == quote.symbol
    end

  end
end
