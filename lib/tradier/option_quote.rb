module Tradier
  class OptionQuote < Base

    attr_reader :symbol, :strike, :last, :bid, :ask, :change

    def ==(option_quote)
      self.symbol == option_quote.symbol
    end
  end
end
