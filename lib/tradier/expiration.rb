require 'tradier/base'
require 'tradier/adjustment'
require 'date'

module Tradier
  class Expiration < Tradier::Base

    def date
      return unless @date || @attrs[:date]

      @date ||= Date.parse(@attrs[:date])
    end

    def strikes
      @strikes ||= @attrs.fetch(:strikes, {}).fetch(:strike, [])
    end

    def adjustments
      @adjustments ||= begin
        pairs = @attrs[:strikes].fetch(:adjustments, {}).fetch(:adjustment, [])
        if pairs.is_a?(Hash)
          [Tradier::Adjustment.from_response(pairs)]
        else
          pairs.map { |p| Tradier::Adjustment.from_response(p) }
        end
      end
    end

    def self.from_response(body={})
      new(body)
    end

  end
end
