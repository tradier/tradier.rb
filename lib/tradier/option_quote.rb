require 'tradier/base'

module Tradier
  class OptionQuote < Base

    attr_reader :symbol, :strike, :last, :bid, :ask, :change, :open_interest, :bid_size, :ask_size, :volume

    def ==(option_quote)
      self.symbol == option_quote.symbol
    end
  end
end
