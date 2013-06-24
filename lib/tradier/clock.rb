require 'tradier/base'

module Tradier
  class Clock < Tradier::Base

    attr_reader :description, :next_change, :next_state, :state

    def date
      return unless @date || @attrs[:date]

      @date ||= Date.parse(@attrs[:date])
    end

    def time
      return unless @time || @attrs[:timestamp]

      @time ||= Time.at(@attrs[:timestamp].to_i)
    end

  end
end
