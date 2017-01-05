require 'tradier/base'

module Tradier
  class Position < Tradier::Base
    attr_reader :cost_basis, :date_acquired, :quantity, :symbol
  end
end
