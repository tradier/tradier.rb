require 'tradier/base'

module Tradier
  class Timesales < Tradier::Base

    def self.from_response(body={})
      new(body)
    end

  end
end
