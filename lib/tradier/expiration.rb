require 'tradier/base'
require 'date'

module Tradier
  class Expiration < Tradier::Base

    def date
      return unless @date || @attrs[:date]

      @date ||= Date.parse(@attrs[:date])
    end

    def strikes
      @strikes ||= (@attrs[:strikes] || [])
    end

    def self.from_response(body={})
      new(body)
    end

  end
end
