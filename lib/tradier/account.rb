require 'tradier/base'

module Tradier
  class Account < Tradier::Base
    attr_reader :account_number, :type

    def margin?
      type.downcase == 'margin'
    end

    def cash?
      type.downcase == 'cash'
    end

    def positions
      @attrs[:positions][:position].map { |a| Tradier::Position.new(a); }
    end

    def orders
      @attrs[:orders][:order].map { |a| Tradier::Order.new(a); }
    end

    def gainloss
    end

    def history
    end

  end
end
