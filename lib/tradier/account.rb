require 'tradier/base'

module Tradier
  class Account < Tradier::Base
    attr_reader :account_number, :type, :classification, :status

    def margin?
      type.downcase == 'margin'
    end

    def cash?
      type.downcase == 'cash'
    end

    def positions
      @attrs.fetch(:positions, {}).
        fetch(:position, []).
        map { |a| Tradier::Position.new(a) }
    end

    def orders
      @attrs.fetch(:orders, {}).
        fetch(:order, []).
        map { |a| Tradier::Order.new(a) }
    end

    def gainloss
      @attrs.fetch(:gainloss, {}).
        fetch(:closed_position, []).
        map { |a| Tradier::Position.new(a) }
    end

    def history
      @attrs.fetch(:history, {}).
        fetch(:event, []).
        map { |a| Tradier::Event.new(a) }
    end

    def individual_account?
      classification && classification.downcase == 'individual'
    end

    def joint_account?
      classification && classification.downcase == 'joint'
    end

    def traditional_ira?
      classification && classification.downcase == 'traditional_ira'
    end

    def roth_ira?
      classification && classification.downcase == 'roth_ira'
    end

    def rollover_ira?
      classification && classification.downcase == 'rollover_ira'
    end

    def ira?
      traditional_ira? || roth_ira? || rollover_ira?
    end

    def entity?
      classification && classification.downcase == 'entity'
    end

  end
end
