require 'tradier/base'
require 'tradier/symbol'

module Tradier
  class OptionQuote < Base

    attr_reader :symbol, :strike, :last, :bid, :ask, :change, :open_interest, :bid_size, :ask_size, :volume

    def put?
      parsed_symbol.put?
    end

    def call?
      parsed_symbol.call?
    end

    def underlier
      parsed_symbol.underlier
    end

    def expiration_date
      return unless @expiration_date || @attrs[:expiration_date]

      @expiration_date ||= Date.parse(@attrs[:expiration_date])
    end

    def ==(option_quote)
      self.symbol == option_quote.symbol
    end

    private

    def parsed_symbol
      @parsed ||= Tradier::Symbol.parse(@attrs[:symbol])
    end
  end
end
