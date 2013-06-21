require 'tradier/base_collection'

module Tradier
  class BalanceCollection < Tradier::BaseCollection

    attr_reader :account_number

    def each(&block)
      balances.each(&block)
    end

    private

    def balances
      @balances ||= @attrs[:balances][:balance].map { |b| Tradier::Balance.new(b) }
    end

  end
end
