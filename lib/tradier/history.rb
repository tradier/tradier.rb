require 'tradier/base'
require 'date'

module Tradier
  class History < Tradier::Base

    attr_reader :open , :close, :high, :low, :volume

    def date
      return unless @date || @attrs[:date]

      @date ||= Date.parse(@attrs[:date])
    end

    def self.from_response(body={})
      new(body)
    end

  end
end
