require 'tradier/base_collection'

module Tradier
  class PositionCollection < Tradier::BaseCollection

    attr_reader :account_number

    def each(&block)
      positions.each(&block)
    end

    private

    def positions
      @positions ||= @attrs[:positions][:position].map { |p| Tradier::Position.new(p) }
    end

  end
end
