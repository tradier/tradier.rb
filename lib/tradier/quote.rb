require 'tradier/base'

module Tradier
  class Quote < Tradier::Base
    attr_reader :symbol

    def ==(quote)
      self.symbol == quote.symbol
    end

  end
end
