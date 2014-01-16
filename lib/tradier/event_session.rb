require 'tradier/base'

module Tradier
  class EventSession < Tradier::Base

    attr_reader :sessionid, :url

    def self.from_response(body={})
      new(body[:stream] || body)
    end
  end
end
