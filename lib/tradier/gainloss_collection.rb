require 'tradier/base_collection'

module Tradier
  class GainlossCollection < Tradier::BaseCollection

    attr_reader :account_number

    def each(&block)
      closed_positions.each(&block)
    end

    private

    def closed_positions
      @closed_positions ||= @attrs[:gainloss][:closed_position].map { |b| Tradier::Position.new(b) }
    end

  end
end
