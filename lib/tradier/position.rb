require 'tradier/base'

module Tradier
  class Position < Tradier::Base
    attr_reader :costbasis, :date_acquired, :quantity, :symbol
  end
end
