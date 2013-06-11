require 'tradier/base'

module Tradier
  class OptionQuote < Base

    attr_reader :symbol, :strike, :last, :bid, :ask, :change, :open_interest

    def ==(option_quote)
      self.symbol == option_quote.symbol
    end
  end
end
