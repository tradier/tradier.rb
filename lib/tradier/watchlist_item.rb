require 'tradier/base'

module Tradier
  class WatchlistItem < Tradier::Base
    attr_reader :symbol
  end
end
