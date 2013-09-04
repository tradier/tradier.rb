require 'tradier/base'

module Tradier
  class Event < Tradier::Base

    attr_reader :symbol, :meta, :description, :event_type, :amount
  end
end
