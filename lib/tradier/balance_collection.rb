require 'tradier/base_collection'

module Tradier
  class BalanceCollection < Tradier::BaseCollection

    attr_reader :account_number

    def each(&block)
      balances.each(&block)
    end

    private

    def balances
      @balances ||= begin
        if @attrs[:balances] == "null"
          []
        elsif @attrs[:balances].is_a?(Hash) && @attrs[:balances].has_key?(:balance) && @attrs[:balances][:balance].is_a?(Hash)
          [Tradier::Balance.new(@attrs[:balances][:balance])]
        elsif @attrs[:balances].is_a?(Hash)
          [Tradier::Balance.new(@attrs[:balances])]
        else
          @attrs[:balances][:balance].map { |b| Tradier::Balance.new(b) }
        end
      end

    end

  end
end
