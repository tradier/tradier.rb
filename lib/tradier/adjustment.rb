require 'tradier/base'

module Tradier
  class Adjustment < Tradier::Base

    attr_reader :type

    def strikes
      @strikes ||= (@attrs[:strikes][:strike] || [])
    end

    def self.from_response(body={})
      new(body[:balances] || body)
    end
  end
end
