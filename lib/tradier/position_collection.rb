require 'tradier/base_collection'

module Tradier
  class PositionCollection < Tradier::BaseCollection

    attr_reader :account_number

    def each(&block)
      positions.each(&block)
    end

    private

    def positions
      @positions ||= begin
        if @attrs[:positions] == "null"
        elsif @attrs[:positions][:position].is_a?(Hash)
          [Tradier::Position.new(@attrs[:positions][:position])]
        else
          @attrs[:positions][:position].map { |p| Tradier::Position.new(p) }
        end
      end
    end

  end
end
