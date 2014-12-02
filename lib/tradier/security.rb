require 'tradier/base'

module Tradier
  class Security < Tradier::Base
    attr_reader :symbol, :exchange, :description, :type, :shares

    def ==(quote)
      self.symbol == quote.symbol
    end

  end
end
