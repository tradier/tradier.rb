require 'tradier/base'

module Tradier
  class Account < Tradier::Base
    attr_reader :account_number, :type, :classification

    def margin?
      type.downcase == 'margin'
    end

    def cash?
      type.downcase == 'cash'
    end

    def positions
      @attrs[:positions][:position].map { |a| Tradier::Position.new(a) }
    end

    def orders
      @attrs[:orders][:order].map { |a| Tradier::Order.new(a) }
    end

    def gainloss
    end

    def history
    end

    def individual_account?
      classification.downcase == 'individual'
    end

    def joint_account?
      classification.downcase == 'joint'
    end

    def traditional_ira?
      classification.downcase == 'traditional_ira'
    end

    def roth_ira?
      classification.downcase == 'roth_ira'
    end

    def rollover_ira?
      classification.downcase == 'rollover_ira'
    end

    def ira?
      traditional_ira? || roth_ira? || rollover_ira?
    end

  end
end
